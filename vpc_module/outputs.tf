output "public_subnet_ids" {
  value = [
    aws_subnet.public_zone1.id,
    aws_subnet.public_zone2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_zone1.id,
    aws_subnet.private_zone2.id
  ]
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "vpc_id" {
  value = aws_vpc.main.id
}