output "rds_ip" {
  value = module.rds.rds_ip
}

output "db_name" {
  description = "DB name"
  value = module.rds.db_name
}

output "db_port" {
  description = "DB port"
  value = module.rds.db_port
}

output "db_username" {
  description = "DB username"
  value = module.rds.db_username
}