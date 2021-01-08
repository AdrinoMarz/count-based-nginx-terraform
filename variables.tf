variable "sg_ports" {
    type        = list(number)
    description = "These ports the EC2 will use for HTTP/HTTPS requests"
    default     = [80, 8080, 8081, 443]
}

variable "ssh_port" {
  description = "The port the server will use for SSH requests"
  type        = number
  default     = 22
}

variable "ingressCIDRblock" {
    description = "The IP the server will use for SSH requests"
    type = list
    default = ["0.0.0.0/0"]
}

variable "ami" {
  default = "ami-04b1ddd35fd71475a"
  description = "The EC2 image ID to launch. default it is set to Amazon linux" 
}

variable "instance_count" {
  default = "2"
  description = "Number of instances"
}

variable "instance_type" {
  default = "t2.micro"
  description = "The size of instance to launch. by default it is set to t2.micro"
}

variable "aws_region" {
  default = "ap-south-1"
  description = "AWS instance region"
}

variable "elb_name" {
  type = list
  default = ["dev-lb", "stage-lb", "prod-lb"]
  description = "multiple load balancer"
}