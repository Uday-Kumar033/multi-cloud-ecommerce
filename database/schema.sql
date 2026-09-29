CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products
(name, price, category, description)
VALUES
('Laptop', 65000, 'Electronics', 'High performance laptop for developers'),
('Headphones', 2500, 'Electronics', 'Wireless noise cancelling headphones'),
('Running Shoes', 3500, 'Fashion', 'Comfortable running shoes');
