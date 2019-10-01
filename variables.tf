variable "identifier" {
  description = "DB name"
  type        = string
  default     = "mydbname1"
}


variable "engine" {
  description = "Your DB engine"
  type        = string
  default     = "postgres"
}


variable "instance_class" {
  description = "Instance class for your DB"
  type        = string
  default     = "db.m5.xlarge"
}

variable "engine_version" {
  description = "DB engine version"
  type        = string
  default     = "9.6"
}

variable "storage_type" {
  description = "DB storage type"
  type        = string
  default     = "gp2"
}

variable "allocated_storage" {
  description = "DB allocated storage"
  type        = number
  default     = 50
}

variable "db_name" {
  description = "DB name"
  type        = string
  default     = "dbpostgres1"
}

variable "db_username" {
  description = "DB user"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "DB password"
  type        = string
  default     = "Password123#"
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = "eu-central-1a"
}

variable "db_subnets" {
  description = "Subnet where DB will be created"
}

variable "vpc_security_group_ids" {
  description = "List for security groups"
  type        = string
  default     = ""
}

variable "db_tags" {
  description = "Map of tags Name for RDS instance"
  type        = map
  default = {
    rds_name    = "DBName1"
    rds_subnets = "DB subnets"
  }
}

variable "db_subnets_name" {
  description = "Name for RDS subnets"
  type        = string
  default     = "db-name-subnets"
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "db_group_description" {
  description = "Description for DB subnets"
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Deletion protection"
  type        = bool
  default     = false
}