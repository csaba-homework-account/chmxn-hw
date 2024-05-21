variable "region" {
  type        = string
  description = "AWS Region"
}

variable vpc_cidr_block {
  type        = string
  description = "VPC CIDR block"
}

variable vpc_name {
  type        = string
  description = "description"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
}
