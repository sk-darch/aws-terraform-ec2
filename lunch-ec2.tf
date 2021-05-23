resource "aws_instance" "nginx" {
  ami = var.image_id
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  subnet_id = aws_subnet.devops-subnet.id
  vpc_security_group_ids = [ aws_security_group.devops-sg.id ]
  user_data = file("nginx.sh")
  tags = {
    "Name" = "DevOps Nginx"
  }
} 

resource "aws_eip" "devops-eip" {
  instance = aws_instance.nginx.id
  vpc = true
  depends_on = [
    aws_internet_gateway.devops-igw
  ]
}