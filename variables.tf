variable "region" {
  description = "ap-south-1"
  default = "ap-south-1"
}

variable "environment" {
  description = "The Deployment environment"
  default = "Development"
}

//Networking
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the public subnet"
  default     = ["10.0.1.0/24"]
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the private subnet"
  default     = ["10.0.2.0/24"]
}

variable "tf_sg_name" {
  type    = string
  default = "tf_sg"
}

variable "instance_name" {
  type    = string
  default = "tf_action_machine"
}
variable "volume_type" {
  type    = string
  default = "gp2"
}
variable "volume_size" {
  type    = number
  default = 8
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-007020fd9c84e18c7"

}

variable "key_pair_name" {
  type    = string
  default = "tf_action_machine_key_pair"
}