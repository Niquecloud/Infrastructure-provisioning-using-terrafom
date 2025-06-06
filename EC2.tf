
# Get the latest Ubuntu 22.04 LTS AMI from Canonical

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
# Create EC2 instance with dynamic AMI ID
resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.test_subnet.id
  vpc_security_group_ids      = [aws_security_group.test_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
  }

  tags = {
    Name = "UbuntuServer"
  }
}
