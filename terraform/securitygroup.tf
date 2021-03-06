resource "aws_security_group" "allow-ssh" {
  vpc_id = "${aws_vpc.discourse_setup.id}"
  name = "allow-ssh"
  description = "security group that allows ssh and ports: 3000,8051-8053 and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 3000
      to_port = 3000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
      from_port = 8051
      to_port = 8053
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

tags {
    Name = "allow-ssh"
  }
}
