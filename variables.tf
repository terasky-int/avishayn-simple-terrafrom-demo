### generic
variable "profile" {
  description = "Name of the AWS profile"
  type        = string
}

variable "aws_region" {
  description = "Name of the AWS region"
  type        = string
}

variable "project" {
  description = "project name"
  type        = string
}

variable "Purpose" {
  description = "Purpose"
  type        = string
}

variable "prefix" {
  description = "prefix for the name of all resources"
  type        = string
}

#network
variable "enable_vpc" {
  description = "Whether to create the VPC"
  type        = bool
  default     = true
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true # The VPC must have DNS hostname and DNS resolution support. Otherwise, EKS nodes can't register their cluster
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true # The VPC must have DNS hostname and DNS resolution support. Otherwise, EKS nodes can't register their cluster
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them."
  type        = bool
  default     = true
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
}

variable "database_subnet_count" {
  description = "Number of database subnets"
  type        = number
}

variable "enable_s3_endpoint" {
  description = "Enable S3 endpoint"
  type        = bool
  default     = false
}

variable "allowed_ports" {
  description = "List of ports to allow"
  type        = list(number)
  default     = [80, 433, 3389, 22]
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
  # Change this to a valid AMI in your chosen region.
  default = "ami-09e67e426f25ce0d7" # Amazon Linux 2 in us-east-1
}

variable "ec2_name" {
  description = "Name tag for the EC2 instance."
  type        = string
  default     = "my-demo-instance"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create."
  type        = string
  default     = "my-demo-bucket-unique-name-123"
}
