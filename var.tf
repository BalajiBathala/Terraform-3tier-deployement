variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
  type        = string
}

#subnets
variable "subnet_cidr_1" {
  default = "10.0.1.0/24"
}

variable "subnet_cidr_2" {
  default = "10.0.2.0/24"
}

variable "subnet_cidr_3" {
  default = "10.0.3.0/24"
}

variable "subnet_cidr_4" {
  default = "10.0.4.0/24"
}

variable "subnet_cidr_5" {
  default = "10.0.5.0/24"
}

variable "subnet_cidr_6" {
  default = "10.0.6.0/24"
}
