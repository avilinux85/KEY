data "aws_ami" "amidata" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amidata.id
  instance_type          = "t2.micro"
  key_name               = "avishek-terraform-key"
  vpc_security_group_ids = [aws_security_group.allow_dynamic_ports.id]
  tags = {
    Name = "myinstance_KEY"
  }
}
