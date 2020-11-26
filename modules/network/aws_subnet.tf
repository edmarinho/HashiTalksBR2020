resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block_01

  tags = {
    Name = format("%s_public", var.env)
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block_02

  tags = {
    Name = format("%s_private", var.env)
  }
}