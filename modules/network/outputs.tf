output "subnet_public" {
    value = aws_subnet.public
}

output "subnet_private" {
    value = aws_subnet.private
}

output "vpc" {
  value = aws_vpc.vpc
}