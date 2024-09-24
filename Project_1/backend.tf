# store the terraform state file in s3

terraform {
  backend "s3" {
    bucket = "terraform-aws-bucket1" // makse sure bucket exists 
    key = "Project_1.tfstate"
    region = "us-east-1"

    
  }
}