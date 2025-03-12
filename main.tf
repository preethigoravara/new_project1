module "rds_instance" {
  source         = "./modules/rds"
  db_name        = "mydatabase"
  username       = "admin"
  password       = "securepassword"
  storage        = 20
  instance_class = "db.t3.micro"
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-terraform-s3-bucket-preethigor"
}
