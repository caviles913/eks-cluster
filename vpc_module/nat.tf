# Elastic IP for NAT
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
    Name = "${local.env}-nat-eip"
  }
}


# NAT gateway in the *public* subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_zone1.id

  depends_on = [aws_internet_gateway.igw] # ensure IGW is ready

  tags = {
    Name = "${local.env}-nat-gateway" ###staging-nat-gateway
  }
}