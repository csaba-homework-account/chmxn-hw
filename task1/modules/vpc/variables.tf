variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS Region"
}

variable vpc_cidr_block {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable vpc_name {
  type        = string
  default     = "hw_vpc"
  description = "description"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["eu-central-1a", "eu-central-1b"]
}
