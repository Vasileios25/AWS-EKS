resource "aws_subnet" "public_subnet" {

 count                   = 1

 vpc_id                  = aws_vpc.main.id

 cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 2, 0)

 availability_zone       = local.zone1

 map_public_ip_on_launch = true


 tags = {

   "Name" = "${local.env}-private-${local.zone1}"
   "kubernetes.io/cluster/${local.env}-${local.eks_name}"  = "owned"

 }

}

resource "aws_subnet" "public_subnet2" {

 count                   = 1

 vpc_id                  = aws_vpc.main.id

 cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 2, 1)

 availability_zone       = local.zone2

 map_public_ip_on_launch = true



 tags = {

   "Name" = "${local.env}-public-${local.zone2}"
   "kubernetes.io/cluster/${local.env}-${local.eks_name}"  = "owned"

 }

}