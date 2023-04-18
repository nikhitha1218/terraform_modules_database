provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_db_server" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name      = "keypair2"
  security_groups = [
    "launch-wizard-1"
  ]

  tags = {
    Name = "web_db_server"
  }
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/welcome/Downloads/keypair2.pem")
    host        = aws_instance.web_db_server.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo service apache2 start",
      "sudo apt-get install -y mysql-server",
      "sudo service mysql start",
      "sudo mysql -e 'CREATE DATABASE my_database;'",
      "sudo mysql -e 'CREATE USER my_user IDENTIFIED BY \"my_password\";'",
      "sudo mysql -e 'GRANT ALL PRIVILEGES ON my_database.* TO my_user;'",
    ]
  }
}

output "public_ip" {
  value = aws_instance.web_db_server.public_ip
}
