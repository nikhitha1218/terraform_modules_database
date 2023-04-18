resource "aws_instance" "mail" { 

  count = var.want_mail == true ? var.mail_count : 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.ssh_keyname
  security_groups = [
    "launch-wizard-1"
  ]

  tags = {
    Name = "Mail-${count.index}"
  }
}