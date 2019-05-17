
# Internet VPC
resource "aws_vpc" "discourse_setup" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "discourse_setup"
    }
}


# Subnets
resource "aws_subnet" "discourse_setup-public-1" {
    vpc_id = "${aws_vpc.discourse_setup.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-1a"

    tags {
        Name = "discourse_setup-public-1"
    }
}

resource "aws_subnet" "discourse_setup-private-1" {
    vpc_id = "${aws_vpc.discourse_setup.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-1a"

    tags {
        Name = "discourse_setup-private-1"
    }
}

# Internet GW
resource "aws_internet_gateway" "discourse_setup-gw" {
    vpc_id = "${aws_vpc.discourse_setup.id}"

    tags {
        Name = "discourse_setup"
    }
}

# route tables
resource "aws_route_table" "discourse_setup-public" {
    vpc_id = "${aws_vpc.discourse_setup.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.discourse_setup-gw.id}"
    }

    tags {
        Name = "discourse_setup-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "discourse_setup-public-1-a-hyperledger" {
    subnet_id = "${aws_subnet.discourse_setup-public-1.id}"
    route_table_id = "${aws_route_table.discourse_setup-public.id}"
}

