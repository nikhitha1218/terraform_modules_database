module "company3_infra" {
  source = "..//startup_module_ec2"
  want_mail = true 
  want_web = true
  mail_count = var.my_mail_count
  web_count = var.my_web_count
}