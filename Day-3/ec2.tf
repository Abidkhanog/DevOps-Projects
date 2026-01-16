resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.vpc_a.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "EC2-SG" }
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0f5ee92e2d63afc18" # Amazon Linux 2023 (Mumbai)
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.vpc_a_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = { Name = "App-Server" }
}

