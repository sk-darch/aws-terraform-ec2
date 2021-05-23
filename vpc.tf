provider "aws" {
  region = var.aws_region
  profile = "skumarp" 
}
# Create VPC
resource "aws_vpc" "devops" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "DevOps VPC"
  }
}
# Create Subnet
resource "aws_subnet" "devops-subnet" {
  vpc_id = aws_vpc.devops.id
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "DevOps Subnet"
  }
}
# Create Internet Gateway
resource "aws_internet_gateway" "devops-igw" {
  vpc_id = aws_vpc.devops.id
  tags = {
    "Name" = "DevOps IGW"
  }
}
# Create Route Table
resource "aws_route_table" "devops-pub-route-table" {
  vpc_id = aws_vpc.devops.id
  tags = {
    "Name" = "DevOps Public RTB"
  }
}
# Create Route in Route Table for Internet Access
resource "aws_route" "devops-pub-route" {
  route_table_id = aws_route_table.devops-pub-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.devops-igw.id
}
# Associate Route Table with Subnet
resource "aws_route_table_association" "devops-rtb-associate" {
  route_table_id = aws_route_table.devops-pub-route-table.id
  subnet_id = aws_subnet.devops-subnet.id
}
# Create Security Group in the VPC with port 80, 22 as inbound open
resource "aws_security_group" "devops-sg" {
  name = "devops-default-sg"
  vpc_id = aws_vpc.devops.id
  description = "DevOps Default Security Group"

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow Port 22"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow Port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


