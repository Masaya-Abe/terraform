resource "aws_vpc" "nb-study" {
  cidr_block          = "10.1.0.0/16"

  tags = {
    Name = "nb-study"
  }
}

resource "aws_route_table" "nb-study-public" {
  vpc_id = aws_vpc.nb-study.id

  tags = {
    Name = "nb-study-route-table"
  }
}

resource "aws_route" "nb-study-public" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.nb-study-public.id
  gateway_id             = aws_internet_gateway.nb-study.id
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.nb-study-public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.nb-study-public.id
}
