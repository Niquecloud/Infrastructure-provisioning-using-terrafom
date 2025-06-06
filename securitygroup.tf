resource "aws_security_group" "test_sg" {
  name        = "websecuritygroup"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # semantically equivalent to all ports
    cidr_blocks      = ["0.0.0.0/0"] # Allow all outbound
  }

  tags = {
    Name = "test_sg"
  }
}