module "example_eg" {
  source = "./security_group"
  name = "module_sg"
  vpc_id = aws_vpc.example.id
  port = 80
  cidr_blocks = ["0.0.0.0/0"]
}
