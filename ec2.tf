

resource "aws_instance" "demo1" {
  ami = var.ami-type
  instance_type = var.instance_type
  #ami             = "ami-04581fbf744a7d11f"
  #instance_type   = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg1.id]
  #security_groups = ["data.aws_security_group.sg1.id"]
  key_name        = "key1"
  user_data       = file("${path.module}/postgresql.sh")
  associate_public_ip_address = true in EC2.TF
  tags = {
    "Name" = "postgresql_server"
    "env"  = "dev"
    "Team" = var.team
  }
}

