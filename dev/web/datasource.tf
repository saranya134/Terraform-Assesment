data "aws_vpc" "vpc" {
     default = true
}
data "aws_iam_role" "Role" {
  name = "AmazonSSMRoleForInstancesQuickSetup"
}
data "aws_availability_zones" "Avaliable-AZ" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
// I created this data block for getting the latest AMI for EC2
data "aws_ami" "AMIFOREC2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
data "aws_subnets" "subnets" {

    filter {

        name   = "vpc-id"

        values = [data.aws_vpc.vpc.id]

    }

}
