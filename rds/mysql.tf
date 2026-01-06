resource "aws_db_subnet_group" "db" {
  name       = "mysql8-subnet-group"
  subnet_ids = var.subnet_ids
  tags       = { Name = "mysql8-subnet-group" }
}

resource "aws_db_instance" "mysql8" {
  identifier = var.db_identifier

  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.db_username
#   password = var.db_password
  manage_master_user_password = true
  port = 3306

  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [aws_security_group.db.id]
  publicly_accessible    = true

  # Sensible defaults for a demo; adjust for production
  storage_encrypted      = true
  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false
  apply_immediately       = true

  # Optional: minor upgrades
  auto_minor_version_upgrade = true

  tags = { Name = "mysql8-demo" }
}
