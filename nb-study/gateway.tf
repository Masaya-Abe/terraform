resource "aws_internet_gateway" "nb-study" {
  vpc_id = aws_vpc.nb-study.id

  tags = {
    Name = "nb-study"
  }
}
