# terraform-aws-rds
Terraform module to creates RDS resources on AWS 

# Terraform version
This module was written and tested with Terraform v0.12.9

# Assumptions
- You want to create security-group which will be attached to VPC and can be consumed by other resources inside VPC
- You have access to AWS console where you can create you security credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
- You configured your security credentials as your environment variables `~/.bash_profile`

```bash
export AWS_ACCESS_KEY_ID=XXXX
export AWS_SECRET_ACCESS_KEY=XXXX
export AWS_DEFAULT_REGION=XXXX
```

# How to consume

- [`example`](https://github.com/andrewpopa/terraform-aws-rds/tree/master/example) folder contain an example of how to consume the module

as pre-requirement you'll need:
- github.com/andrewpopa/terraform-aws-vpc
- github.com/andrewpopa/terraform-aws-security-group

```terraform
module "rds" {
  source                 = "../"
  identifier             = "mydbname1"
  engine                 = "postgres"
  instance_class         = "db.m5.xlarge"
  engine_version         = "9.6"
  storage_type           = "gp2"
  allocated_storage      = 50
  db_name                = "postgres"
  db_username            = "postgres"
  db_password            = "Password123#"
  availability_zone      = "eu-central-1a"
  db_subnets             = module.vpc.private_subnets
  vpc_security_group_ids = module.security-group.sg_id
  db_tags = {
    rds_name    = "DBName1"
    rds_subnets = "DB subnets"
  }
  db_group_description = "DB-group-subnets"
}
```

# Inputs
| **Name**  | **Type** | **Default** | **Required** | **Description** |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| identifier | string | mydbname1 | no | DB name |
| engine | string | postgres | yes | Your DB engine |
| instance_class | string | db.m5.xlarge | yes | Instance class for your DB |
| engine_version | string | 9.6 | no | DB engine version | 
| storage_type | string | gp2 | yes | DB storage type |
| allocated_storage | string | 50 | yes | DB allocated storage |
| db_name | string | dbpostgres1 | yes | DB name |
| db_username | string | postgres | yes | DB user |
| db_password | string | Password123# | yes | DB password |
| availability_zone | string | eu-central-1a | yes | Availability zone |
| db_subnets | string |  | yes | Subnet where DB will be created |
| vpc_security_group_ids | string |  | yes | List for security groups |
| db_tags | map |  | yes | Map of tags Name for RDS instance |
| db_group_description | string | default | yes | Tags |

# Outputs
| **Name**  | **Type** | **Description** |
| ------------- | ------------- | ------------- |
| rds_ip | string | RDS ip |
| db_name | string | DB name |
| db_port | string | DB port |
| db_username | string | DB username |
