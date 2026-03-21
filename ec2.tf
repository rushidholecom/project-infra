provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "ec2-tfstate-bucket" {
  bucket = "ec2-tfstate"

  
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
}