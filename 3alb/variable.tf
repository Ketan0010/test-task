variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

variable "target_port" {
  type    = number
  default = 80
}