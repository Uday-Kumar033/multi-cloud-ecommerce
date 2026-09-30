output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "backend_ecr_repository" {
  description = "Backend ECR repository"
  value       = aws_ecr_repository.backend.repository_url
}

output "frontend_ecr_repository" {
  description = "Frontend ECR repository"
  value       = aws_ecr_repository.frontend.repository_url
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.db.db_instance_endpoint
}

output "rds_address" {
  description = "RDS hostname"
  value       = module.db.db_instance_address
}

output "rds_master_user_secret_arn" {
  description = "ARN of the RDS managed master user secret"
  value       = module.db.db_instance_master_user_secret_arn
}
