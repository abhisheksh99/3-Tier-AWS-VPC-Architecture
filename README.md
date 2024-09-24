# My Terraform Project

This project uses Terraform to set up AWS infrastructure for a multi-tier application.

## Project Structure

The project sets up a VPC with public and private subnets across two availability zones.

## Configuration

Before running this Terraform project, you need to set up the following variables. Create a `terraform.tfvars` file in the root of the project and add the following variables with your own values:

```hcl
aws_region                   = "enter_your_aws_region"
project_name                 = "enter_your_project_name"
vpc_cidr_block               = "enter_your_vpc_cidr_block"
pub_subnet_1_cidr_block      = "enter_your_public_subnet_1_cidr_block"
pub_subnet_2_cidr_block      = "enter_your_public_subnet_2_cidr_block"
pri_subnet_1_cidr_block      = "enter_your_private_subnet_1_cidr_block"
pri_subnet_2_cidr_block      = "enter_your_private_subnet_2_cidr_block"
pri_data_subnet_1_cidr_block = "enter_your_private_data_subnet_1_cidr_block"
pri_data_subnet_2_cidr_block = "enter_your_private_data_subnet_2_cidr_block"