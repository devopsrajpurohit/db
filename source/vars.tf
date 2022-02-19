
variable "aws_region" {
  type        = string
  description = "Aws region where resourecs will be created."
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Name of project in which all resources will be created."
  default     = "test"
}

variable "database_username" {
  type        = string
  description = "Username for database"
  default     = "test"
}

variable "database_password" {
  type        = string
  description = "Database for password"
  default     = "test2353536gwsdg"
}


variable "database_host" {
  type        = string
  description = "Database for password"
  default     = "test2353536gwsdg"
}

variable "source_frontend_repo" {
  type        = string
  description = "Github repo which will be used as base repo for frontend service."
  default     = "test2353536gwsdg"
}


variable "source_backend_repo" {
  type        = string
  description = "Github repo which will be used as base repo for backend service."
  default     = "test2353536gwsdg"
}

variable "database_name" {
  type        = string
  description = "Name of database"
  default     = "test2353536gwsdg"
}

variable "database_instance_type" {
  type        = string
  description = "type of database instance"
  default     = "db.r5.large"
}

variable "github_owner" {
  type        = string
  description = "github token"
  default     = ""
}
variable "backend_repo" {
  type        = string
  description = "github token"
  default     = ""
}

variable "frontend_repo" {
  type        = string
  description = "github token"
  default     = ""
}

variable "branch" {
  type        = string
  description = "github token"
  default     = ""
}
variable "github_token" {
  type        = string
  description = "github token"
  default     = ""
}

variable "build_timeout" {
  type        = number 
  description = "build timeout in seconds"
  default     = 60
}
variable "health_check" {
  type        = string 
  description = "build timeout in seconds"
  default     = "/"
}
variable "path" {
  type        = string 
  description = "build timeout in seconds"
  default     = "/"
}


variable "containerPort" {
  type        = number 
  description = "port number for container"
  default     = 80
}

variable "db_engine" {
  type        = string 

}

variable "db_engine_version" {
  type        = string 
 
}
