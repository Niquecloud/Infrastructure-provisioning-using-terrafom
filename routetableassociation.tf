resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_RT.id
}