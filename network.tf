resource "aws_vpc" "environment-example-two" {
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	enable_dns_support = true
}

resource "aws_subnet" "subnet1" {
	cidr_block = "10.0.1.0/24"
	vpc_id = aws_vpc.environment-example-two.id
	availability_zone = "ap-southeast-1a"
}

resource "aws_subnet" "subnet2" {
	cidr_block = "10.0.2.0/24"
	vpc_id = aws_vpc.environment-example-two.id
	availability_zone = "ap-southeast-1b"
}

resource "aws_subnet" "subnet3" {
	cidr_block = "10.0.3.0/24"
	vpc_id = aws_vpc.environment-example-two.id
	availability_zone = "ap-southeast-1c"
}

resource "aws_security_group" "subnet_security" {
	vpc_id = aws_vpc.environment-example-two.id
	ingress {
		cidr_blocks = [
			aws_vpc.environment-example-two.cidr_block
		]
	from_port = 80
	to_port = 80
	protocol = "tcp"
	}
}
