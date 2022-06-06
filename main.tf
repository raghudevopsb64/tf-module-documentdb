resource "aws_docdb_cluster" "main" {
  cluster_identifier              = "${var.COMPONENT}-${var.ENV}"
  engine                          = var.ENGINE
  engine_version                  = var.ENGINE_VERSION
  master_username                 = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["DOCDB_USERNAME"]
  master_password                 = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["DOCDB_PASSWORD"]
  skip_final_snapshot             = var.SKIP_FINAL_SNAPSHOT
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.default.name
  db_subnet_group_name            = aws_docdb_subnet_group.main.name
}