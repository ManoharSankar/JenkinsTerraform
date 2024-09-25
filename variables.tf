variable "aws_region" {
  description = "The AWS region to launch resources in"
  type        = string
  default     = "ap-south-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to be created"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0522ab6e1ddcc7055"
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Existing Key Pair Name for EC2"
  type        = string
}
