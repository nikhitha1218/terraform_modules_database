variable "my_region" {
  type = string
  default = "ap-south-1"
  description = "This variable is used to specify in which region the instance is created"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "This variable is used to specify the instance type/size"
}

variable "ssh_keyname" {
  type = string
  default = "keypair2"
  description = "What is the SSH keyname to use?"
}

variable "want_web" {
  type = bool
  default = true
}

variable "want_mail" {
  type = bool
  default = true
}

variable "mail_count" {
  type = number
  default = 1
}

variable "web_count" {
  type = number
  default = 1
}