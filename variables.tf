variable "instances" {
  type = map
  default = {
    mongodb = "t3.small"
    redis = "t2.micro"
    rabbitmq = "t2.micro"
    mysql = "t3.small"
    user = "t2.micro"
    shipping = "t3.small"
    cart = "t2.micro"
    catalogue = "t2.micro"
    payment = "t2.micro"
    dispatch = "t2.micro"
    web = "t2.micro"

  }
}


variable "sg_id" {
  type = string
  default = "sg-0aaab2bdfa4e9f45a"
}

variable "common_tags" {
  type = map
  default = {
    Name = "roboshop"
    terraform = "true"
    environment = "dev"
  }
}

variable "project" {
  type = string
  default = "roboshop"
}
variable "environment" {
  type = string
  default = "dev"
}

variable "zone_id"{
    default = ""
} 

variable "domain_name" {
  default = "vasanthreddy.space"
}