resource "aws_instance" "example" {
  ami           = "ami-08d658f84a6d84a80"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.discourse_setup-public-1.id}"
  tags {
      Name = "${var.INSTANCE_DEVICE_NAME}"
  }
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  
  # the public SSH key
  key_name = "${aws_key_pair.mykey-tit.key_name}"

  user_data = <<EOF
#! /bin/bash
wget -qO- https://get.docker.com/ | sh
sudo -s
git clone https://github.com/discourse/discourse_docker.git /var/discourse
cd /var/discourse
EOF

}