data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-b64"
    key    = "vpc/dev/${var.COMPONENT}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_secretsmanager_secret" "secret" {
  name = "roboshop"
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}
