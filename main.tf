provider "aws" {
	region = var.aws_region
}
# S3 Bucket Creation
resource "aws_s3_bucket" "terraform_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
  tags = {
    Name = var.s3_bucket_name
  }
}
# EC2 Instance Creation
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "MyTerraformEC2Instance"
  }
}
# Optional security group to allow SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Associate the security group with the EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}
