module "vpc" {
    source               = "./modules/vpc/"

    region               = var.region
    vpc_cidr_block       = var.vpc_cidr_block
    vpc_name             = var.vpc_name
    public_subnet_cidrs  = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    azs                  = var.azs
}
