resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.project_name}-db"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]

  tags = {
    Name = "DB subnet group for rds-${var.project_name}"
  }
}

resource "aws_security_group" "rds-security_group" {
  name        = "${var.project_name}-db"
  vpc_id      =  module.vpc.vpc_id
  description = "rds security group for ${var.project_name}"
}
resource "aws_security_group_rule" "rule" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds-security_group.id
  source_security_group_id = aws_security_group.ecs.id
}

resource "aws_rds_cluster" "database" {
  cluster_identifier      = "${var.project_name}-database"
  engine                  = var.db_engine
  engine_version          =  var.db_engine_version
  database_name           = var.database_name
  master_username         = var.database_username
  master_password         = var.database_password 
  skip_final_snapshot = true
  apply_immediately = true 
  vpc_security_group_ids  = [aws_security_group.rds-security_group.id]
  db_subnet_group_name    = aws_db_subnet_group.db_subnet.name
}
resource "aws_rds_cluster_instance" "database-instance" {
  apply_immediately    = true
  cluster_identifier   = "${aws_rds_cluster.database.cluster_identifier}"
  identifier           = var.database_name
  instance_class       = var.database_instance_type
  engine               = aws_rds_cluster.database.engine
  engine_version       = aws_rds_cluster.database.engine_version
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
}

