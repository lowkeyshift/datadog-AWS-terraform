#############################################################################
# EC2 details
#############################################################################
variable "aws_region" {
    default = "<aws-region>"
}

variable "owners" {
    description = "This is the owner id of the ami"
    default = "<owner-id>" # This can be found on the AMI details when selecing an AMI
}

variable "ami" {
    description = "This is an Amazon Linux disctro"
    default = "<ami-id>" ## amzn-ami-hvm-2018.03.0.20180622-x86_64-gp2 (ami-cfe4b2b0)
}

variable "ec2-key" {
    description = "This is the key pair name use at launch, which is used to ssh -i into box"
    default = "<ec2-key>" # Key that was assined at instance launch
}

#############################################################################
# Network
#############################################################################
variable "cidr_blocks" {
  description = "The CIDR block to use for the poc VPC."
  default = "<CIDR-IP-ADDR/<#>" # This CIDR is assigned to the VPC
}
variable "aws_vpc_id" {
  description = "VPC id for the default VPC."
  default = "<vpc-id>"
}

variable "subnet_id" {
    default = "<subnet-id>"
}

#############################################################################
# Security Group
#############################################################################
variable "security_group_id" {
  description = "SG for poc VPC. (support-demo)"
  default = "<security-group-id>"
}
variable "security_group_id_1" {
  description = "SG for poc VPC. (default)"
  default = "<security-group-id>"
}

#############################################################################
# Datadog
#############################################################################
variable "datadog_api_key" {
    description = "This key can be found at https://app.datadoghq.com/account/settings#api"
    default = "<API-KEY>"
    }
variable "datadog_app_key" {
    description = "This key can be found/created at https://app.datadoghq.com/account/settings#api"
    default = "<APP-KEY>"
}
