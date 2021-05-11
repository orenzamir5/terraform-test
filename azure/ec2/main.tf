provider "azure" {
  region = "us-east-1"  
}

resource "aws_instance" "my-first-server" {
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
}
