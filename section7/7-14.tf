resource "aws_subnet" "private_0" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.20.65.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
}
