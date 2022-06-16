resource "null_resource" "schema" {
  provisioner "local-exec" {
    command = <<EOT
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
cd /tmp
curl -L -O https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
unzip /tmp/mongodb.zip
cd mongodb-main
mongo --ssl --host ${aws_docdb_cluster.main.endpoint}:27017 --sslCAFile /tmp/rds-combined-ca-bundle.pem --username admin1 --password <insertYourPassword>
mongo --host ${aws_docdb_cluster.main.endpoint} -u${jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["DOCDB_USERNAME"]} -p${jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["DOCDB_PASSWORD"]} <${var.DB_NAME}.js
EOT
  }
}
