output "rds_ip" {
  description = "DB instance address"
  value = aws_db_instance.tf_rds.address
}

output "db_name" {
  description = "DB name"
  value = aws_db_instance.tf_rds.name
}

output "db_port" {
  description = "DB port"
  value = aws_db_instance.tf_rds.port
}

output "db_username" {
  description = "DB username"
  value = aws_db_instance.tf_rds.username
}