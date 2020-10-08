resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.nb-study.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.1.1.0/24"

  tags = {
    Name = "nb-study-public-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.nb-study.id
  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.1.2.0/24"

  tags = {
    Name = "nb-study-public-1c"
  }
}
