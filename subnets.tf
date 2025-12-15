resource "aws_subnet" "private_zone1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = local.zone1

  tags = {
    Name                                       = "${local.env}-private-${local.zone1}"
    "kubernetes.io/role/internal-elb"          = "1"
    "kubbernetes.io/cluster/${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_zone2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = local.zone2

  tags = {
    Name                                       = "${local.env}-private-${local.zone2}"
    "kubernetes.io/role/internal-elb"          = "1"
    "kubbernetes.io/cluster/${local.eks_name}" = "owned"
  }
}