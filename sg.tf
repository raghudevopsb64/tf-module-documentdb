resource "aws_security_group" "main" {
  name        = "allow_documentdb_${var.COMPONENT}_${var.ENV}"
  description = "allow_documentdb_${var.COMPONENT}_${var.ENV}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "MONGODB"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_documentdb_${var.COMPONENT}_${var.ENV}"
  }
}

