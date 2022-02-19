
module "database_server" {
  source                 = "./source"
  project_name           = "test"
  database_username      = "project_admin"
  database_password      = "password"
  database_instance_type = "db.r6g.large"
  aws_region = "ca-central-1"
  db_engine_version= "13.4"
  db_engine= "aurora-postgresql"
}



 