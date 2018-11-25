#############################################################################
# AWS Provider
#############################################################################

provider "aws" {
  region = "${var.aws_region}"
}

data "aws_security_group" "selected" {
  id = "${var.security_group_id}"
}

#############################################################################
# New AWS Instance
#############################################################################

resource "aws_instance" "web-server" {
  ami = "${var.ami}"
  instance_type = "t2.small"
  key_name = "${var.ec2-key}"
  vpc_security_group_ids = ["${var.security_group_id}", "${var.security_group_id_1}"]
  subnet_id = "${var.subnet_id}"

  tags {
    Name = "terraform-web-server"
    "Terraform" = "true"
    "Environment" = "${terraform.workspace}"
  }
}
