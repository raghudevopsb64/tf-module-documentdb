resource "aws_docdb_cluster_parameter_group" "default" {
  name   = "${var.COMPONENT}-pg"
  family = var.FAMILY
}