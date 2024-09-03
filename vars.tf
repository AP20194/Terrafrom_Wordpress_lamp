variable "AWS_REGION" {
  default = "us-west-1"
}

variable "AWS_PROFILE" {
  default = "default"
}

########################   Internet Gateway   ########################

variable "NAME_IGW" {
  default = "preprod-wp-igw"
}

########################   Elastic IP   ########################

variable "NAME_EIP" {
  default = "prod-wp-eip"
}

########################   Route Table   ########################

variable "CIDR_RT" {
  default = "0.0.0.0/0"
}

variable "NAME_RT" {
  default = "preprod-wp-rt"
}

########################   VPC   ########################

variable "AWS_VPC_CIDR" {
  default = "10.1.0.0/16"
}

variable "AWS_VPC_NAME" {
  default = "Preprod-WP-VPC"
}

########################   Subnet   ########################

variable "NAME_SUB_PUB1" {
  default = "PreProd-WP-Subnet-Public1-1a"
}

variable "CIDR_SUB_PUB1" {
  default = "10.1.1.0/24"
}

variable "AZ_SUB_PUB1" {
  default = "us-west-1a"
}

########################

variable "NAME_SUB_PUB2" {
  default = "PreProd-WP-Subnet-Public2-1b"
}

variable "CIDR_SUB_PUB2" {
  default = "10.1.2.0/24"
}

variable "AZ_SUB_PUB2" {
  default = "us-west-1b"
}

########################

variable "NAME_SUB_PVT1" {
  default = "PreProd-WP-Subnet-Private1-1a"
}

variable "CIDR_SUB_PVT1" {
  default = "10.1.3.0/24"
}

variable "AZ_SUB_PVT1" {
  default = "us-west-1a"
}

########################

variable "NAME_SUB_PVT2" {
  default = "PreProd-WP-Subnet-Private2-1b"
}

variable "CIDR_SUB_PVT2" {
  default = "10.1.4.0/24"
}

variable "AZ_SUB_PVT2" {
  default = "us-west-1b"
}

########################   Security Group   ########################

variable "NAME_SG" {
  default = "Preprod-WP-SG"
}

########################   EC2   ########################

variable "EC2_INSTANCE_TYPE" {
  default = "t3.small"
}

variable "EC2_AMI_ID" {
  default = "ami-0d53d72369335a9d6" # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
}

variable "EC2_KEY_NAME" {
  description = "preprod-wp-key"
  default     = "preprod-wp-key" # Replace with the actual key pair name
}

variable "NAME_EC2" {
  default = "preprod-wp"
}

########################   Route53 and ACM  ########################

variable "aws_route53_zone" {
  default = "every1lending.com"
}

variable "NAME_DOMAIN" {
  default = "preprod.every1lending.com"
}

variable "NAME_ACM" {
  default = "PreProd-WP-Cert"
}

########################   CloudFront  ########################

variable "NAME_ORIGIN_ID" {
  default = "wordpress"
}

variable "CLOUDFRONT_ALIAS" {
  description = "Alias for the CloudFront distribution"
  default     = "preprod.every1lending.com" # Change this to your actual domain
}