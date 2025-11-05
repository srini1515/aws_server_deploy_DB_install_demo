data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Amazon Linux 2023 kernel-6.1 AMI"]
  }
}

resource "aws_instance" "free_tier_linux" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"  
  associate_public_ip_address = true

  tags = {
    Name = "Free-Tier-Linux"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "Hello from Terraform + AWS Free Tier!" > /var/www/html/index.html
              EOF
}

output "public_ip" {
  value = aws_instance.free_tier_linux.public_ip
}
