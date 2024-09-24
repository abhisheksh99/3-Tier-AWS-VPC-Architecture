output "project-name"{
    value = var.project_name
}

output "vpc_id"{
    value = aws_vpc.vpc.id
}

output "public-subnet-az1-id"{
    value = aws_subnet.public-sub-az-1.id
}

output "public-subnet-az2-id"{
    value = aws_subnet.public-sub-az-2.id
}

output "private-subnet-az1-id" {
    value = aws_subnet.private-sub-az-1.id
}

output "private-subnet-az2-id"{
    value = aws_subnet.private-sub-az-2.id
}


output "private-data-subnet-az1-id" {
    value = aws_subnet.private-data-sub-az-1.id
}

output "private-data-subnet-az2-id"{
    value = aws_subnet.private-data-sub-az-2.id
}

output "internet-gateway" {
    value = aws_internet_gateway.internet-gateway
  
}