# create vpc
module "vpc" {
    source = "../modules/vpc"
    project_name= var.project_name
    vpc_cidr_block=var.vpc_cidr_block
    pub_subnet_1_cidr_block=var.pub_subnet_1_cidr_block
    pub_subnet_2_cidr_block=var.pub_subnet_2_cidr_block
    pri_subnet_1_cidr_block=var.pri_subnet_1_cidr_block
    pri_subnet_2_cidr_block=var.pri_data_subnet_2_cidr_block
    pri_data_subnet_1_cidr_block=var.pri_data_subnet_1_cidr_block
    pri_data_subnet_2_cidr_block=var.pri_data_subnet_2_cidr_block

}