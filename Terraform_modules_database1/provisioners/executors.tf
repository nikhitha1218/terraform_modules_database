provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name      = "keypair2"
  security_groups = [
    "launch-wizard-1"
  ]

  tags = {
    Name = "web_server"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/welcome/Downloads/keypair2.pem")
    host        = aws_instance.web_server.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo apt-get install -y mysql-server"
    ]
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}
