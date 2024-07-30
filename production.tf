resource "random_id" "random_id_prefix" {
  byte_length = 2
}
locals {
  production_availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
}

module "networking" {
  source = "./modules/networking"

  region               = var.region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = local.production_availability_zones
}


resource "aws_security_group" "tf_sg" {
  name        = var.tf_sg_name
  description = "Allow inbound traffic via SSH"
  vpc_id      = module.networking.vpc_id
  depends_on  = [module.networking]

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_key_pair" "tf_key" {
#   key_name   = var.key_pair_name
#   public_key = file("${path.module}/${var.key_pair_name}.pub")
# }


resource "aws_s3_bucket" "tf_course" {
    bucket = var.bucket_name
}

resource "aws_instance" "tf_action_machine" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = true
  }
  key_name               = var.key_pair_name
  vpc_security_group_ids = ["${aws_security_group.tf_sg.id}"]
  subnet_id              = flatten(module.networking.public_subnets_id)[0]
  depends_on             = [module.networking]

  # nginx installation
  provisioner "file" {
      source = "nginx.sh"
      destination = "/tmp/nginx.sh"
  }

  provisioner "remote-exec" {
      inline = [
          "chmod +x /tmp/nginx.sh",
          "sudo /tmp/nginx.sh"
      ]
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    host     = self.public_ip
    private_key = file("${path.module}/${var.key_pair_pem}")
  }

}

