resource "aws_docdb_subnet_group" "main" {
  name       = "${var.COMPONENT}-${var.ENV}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.SUBNET_IDS

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}
