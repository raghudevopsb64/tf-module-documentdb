output "DOCDB_ENDPOINT" {
  value = aws_docdb_cluster.main.endpoint
}

output "DOCDB_USERNAME" {
  value = aws_docdb_cluster.main.master_username
}

output "DOCDB_PASSWORD" {
  value = aws_docdb_cluster.main.master_password
}
