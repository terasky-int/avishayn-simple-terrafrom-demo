######################################
# Create an EC2 Instance
######################################
resource "aws_instance" "demo_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.ec2_name
  }
}


resource "aws_instance" "windows_server" {
  ami                    = "ami-0d2b6dd8446bf0f28" # Windows Server AMI
  instance_type          = "t3.medium"
  subnet_id              = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.public_sg.id]


  tags = {
    Name = "Demo-Server"
  }
}

######################################
# Create an S3 Bucket
######################################
resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.s3_bucket_name
}
