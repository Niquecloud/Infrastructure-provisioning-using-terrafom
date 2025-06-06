resource "aws_route_table" "test_RT" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_gw.id
  }

  
  tags = {
    Name = "test_gw"
  }
}