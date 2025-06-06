resource "aws_internet_gateway" "test_gw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test_gw"
  }
}