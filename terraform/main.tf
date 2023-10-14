terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.44.0"
    }
  }

  required_version = ">= 1.3.7"

  # Uncomment after creating the bucket
  # backend "s3" {
  #   bucket = "tfstate-bucket"
  #   key    = "terraform/state/bootstrap"
  #   region = "${var.region}"
  # }
}

module "runners_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "runners-sg"
  description = "Security group for GitHub Runners"
  # vpc_id      = module.ops_vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "170.133.228.85/32"
    },
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      description = "rdp"
      cidr_blocks = "170.133.228.85/32"
    },
  ]

  egress_with_cidr_blocks = [
    {
        rule        = "all-all"
        cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "ec2_linux_runner" {
  create = var.create_linux_runner

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "cicd_linux_runner"

  ami                    = "ami-0ea18256de20ecdfc"
  instance_type          = "t2.micro"
  key_name               = "andy-key"
  monitoring             = true
  vpc_security_group_ids = [module.runners_sg.security_group_id]
  # subnet_id              = module.pre_vpc.public_subnets[0]
  user_data              = "${file("./scripts/linux.sh")}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_windows_runner" {
  create = var.create_windows_runner

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "cicd_windows_runner"

  ami                    = "ami-0ffac754210294cd5"
  instance_type          = "t2.micro"
  key_name               = "andy-key"
  monitoring             = true
  vpc_security_group_ids = [module.runners_sg.security_group_id]
  # subnet_id              = module.pre_vpc.public_subnets[0]
  user_data              = "${file("./scripts/windows.ps1")}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}