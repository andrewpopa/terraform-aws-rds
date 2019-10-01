# RDS

resource "aws_db_subnet_group" "tf_db_subnet_group" {
  name        = var.db_subnets_name
  subnet_ids  = var.db_subnets
  description = var.db_group_description
  tags = {
    Name = var.db_tags["rds_subnets"]
  }
}

resource "aws_db_instance" "tf_rds" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  availability_zone      = var.availability_zone
  db_subnet_group_name   = aws_db_subnet_group.tf_db_subnet_group.id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  skip_final_snapshot    = var.skip_final_snapshot
  deletion_protection    = var.deletion_protection
  tags = {
    Name = var.db_tags["rds_name"]
  }
}