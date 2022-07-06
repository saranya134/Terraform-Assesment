variable "ami_id" {
    type = string
    default = "ami-065deacbcaac64cf2"
}

variable "instance_type" {
  type = string
  default = "t2.small"
}

variable "region" {
  type = string
  default = "eu-central-1"
}

variable "load_balancer_type" {
   type = string
  default = "application"
}
variable "key_pair" {
    type = string
    description = "Key Pair you want to attach to the instance"
    default="terraform"
}