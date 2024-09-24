# creating  vpc
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
        Name = "${var.project_name}-vpc"
    }
  
}

# create internetgateway and attach it to vpc
resource "aws_internet_gateway" "internet-gateway" {
    vpc_id = aws_vpc.vpc.id

    tags ={
        Name = "${var.project_name}-igw"
    }
  
}

#use data source to get all availability zones in the region
data "aws_availability_zones" "avail_zone" {
  
}

#create public subnet az1
resource "aws_subnet" "public-sub-az-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pub_subnet_1_cidr_block
    availability_zone = data.aws_availability_zones.avail_zone.names[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-az-1"
    }
  
}

#create public subnet az2
resource "aws_subnet" "public-sub-az-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pub_subnet_2_cidr_block
    availability_zone = data.aws_availability_zones.avail_zone.names[1]
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-az-2"
    }
  
}

# create route table and add pulic route
resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id
    }

    tags = {
        Name = "public-route-table"
    }
  
}

# associate public subnet az1 to public route table
resource "aws_route_table_association" "pub-sub-1-rt-association" {
    subnet_id = aws_subnet.public-sub-az-1.id
    route_table_id = aws_route_table.public-route-table.id
  
}

# associate public subnet az2 to public route table
resource "aws_route_table_association" "pub-sub-2-rt-association" {
    subnet_id = aws_subnet.public-sub-az-2.id
    route_table_id = aws_route_table.public-route-table.id
  
}

#create private subnet az1
resource "aws_subnet" "private-sub-az-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_subnet_1_cidr_block
    availability_zone = data.aws_availability_zones.avail_zone.names[0]
    map_public_ip_on_launch = false

    tags = {
        Name = "private-subnet-az-1"
    }
  
}

#create private subnet az2
resource "aws_subnet" "private-sub-az-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_subnet_2_cidr_block
    availability_zone = data.aws_availability_zones.avail_zone.names[1]
    map_public_ip_on_launch = false

    tags = {
        Name = "private-subnet-az-2"
    }
  
}


#create private data subnet az1
resource "aws_subnet" "private-data-sub-az-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_data_subnet_1_cidr_block
    availability_zone = data.aws_availability_zones.avail_zone.names[0]
    map_public_ip_on_launch = false

    tags = {
        Name = "private-data-subnet-az-1"
    }
  
}

#create private data subnet az2
resource "aws_subnet" "private-data-sub-az-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_data_subnet_2_cidr_block
    availability_zone = data.aws_availability_zones.avail_zone.names[1]
    map_public_ip_on_launch = false

    tags = {
        Name = "private-data-subnet-az-2"
    }
  
}
