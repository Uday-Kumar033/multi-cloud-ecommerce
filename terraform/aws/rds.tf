module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 7.0"

  identifier = "${var.project_name}-postgres"

  engine               = "postgres"
  engine_version       = "16"
  family               = "postgres16"
  major_engine_version = "16"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  port     = 5432

  # AWS manages the master password using Secrets Manager.
  manage_master_user_password = true

  multi_az            = false
  publicly_accessible = false

  deletion_protection = false
  skip_final_snapshot = true

  subnet_ids = module.vpc.database_subnets

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  tags = {
    Project     = var.project_name
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}


resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "Security group for PostgreSQL RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "PostgreSQL from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}
