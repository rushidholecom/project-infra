provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "ec2_tfstate_bucket" {
  bucket = "ec2-tfstate-bucket-rushi"
}

resource "aws_instance" "jenkins-prac" {
  ami = "ami-09dbc7ce74870d573"
  instance_type = "t3.micro"
  key_name = "rushi-rd369-london"
  vpc_security_group_ids = ["sg-00ac324807d28933a"]
  tags = {
    Name = "jenkins-prac"
    env = "dev"
  }
  depends_on = [ aws_s3_bucket.ec2_tfstate_bucket ]
}

terraform {
  backend "s3" {
    bucket         = "ec2-tfstate-bucket-rushi"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
  }
}