resource "aws_security_group" "private_sg" {
  name   = join("-", [var.prefix, "private_sg"])
  vpc_id = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All"
  }

  tags = {
    Name = join("-", [var.prefix, "private_sg"])
  }
}

resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Allow access from my IP and other public_sg hosts"
  vpc_id      = module.vpc.vpc_id

  # Allow traffic from specific ports (dynamic ingress rules)
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["${local.my_public_ip.ip}/32"]
    }
  }



  # Allow all traffic from my office IP
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["213.8.192.226/32"]
    description = "Allow all traffic from my office"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = join("-", [var.prefix, "public_sg"])
  }
}

resource "aws_security_group_rule" "public_to_private" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.private_sg.id
  source_security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_to_public" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.public_sg.id
  source_security_group_id = aws_security_group.public_sg.id

}