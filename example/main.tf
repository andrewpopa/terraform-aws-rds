module "vpc" {
  source = "github.com/andrewpopa/terraform-aws-vpc"

  # VPC
  cidr_block          = "172.16.0.0/16"
  vpc_public_subnets  = ["172.16.10.0/24", "172.16.11.0/24", "172.16.12.0/24"]
  vpc_private_subnets = ["172.16.13.0/24", "172.16.14.0/24", "172.16.15.0/24"]
  vpc_tags = {
    vpc            = "my-aws-vpc"
    public_subnet  = "public-subnet"
    private_subnet = "private-subnet"
    internet_gw    = "my-internet-gateway"
    nat_gateway    = "nat-gateway"
  }
}

module "security-group" {
  source = "github.com/andrewpopa/terraform-aws-security-group"

  # Security group
  security_group_name        = "my-aws-security-group"
  security_group_description = "my-aws-security-group-descr"
  ingress_ports              = [22, 443, 8800, 5432]
  vpc_id                     = module.vpc.vpc_id
}

module "rds" {
  source                 = "../"
  identifier             = "mydbname1"
  engine                 = "postgres"
  instance_class         = "db.m5.xlarge"
  engine_version         = "9.6"
  storage_type           = "gp2"
  allocated_storage      = 50
  name                   = "postgres"
  username               = "postgres"
  password               = "Password123#"
  availability_zone      = "eu-central-1a"
  db_subnets             = module.vpc.private_subnets
  vpc_security_group_ids = module.security-group.sg_id
  db_tags = {
    rds_name    = "DBName1"
    rds_subnets = "DB subnets"
  }
  db_group_description = "DB-group-subnets"
}
