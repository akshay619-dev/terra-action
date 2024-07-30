variable "environment" {
  description = "The Deployment environment"
  default = "Development"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
  default     = ["10.0.1.0/24"]
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the private subnet"
  default     = ["10.0.2.0/24"]
}

variable "region" {
  description = "The region to launch the bastion host"
  default     = "ap-south-1"
}

variable "availability_zones" {
  type        = list
  description = "The az that the resources will be launched"
  default     = ["ap-south-1a", "ap-south-1b"]
}
