resource "aws_instance" "free_tier_linux" {
  ami           = "ami-057dd22272ffb804d"  # Amazon Linux 2023 (x86_64)
  instance_type = "t2.micro"               # Free-tier eligible
  tags = {
    Name = "Free-Tier-Linux"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "Hello from Terraform on Amazon Linux 2023!" > /var/www/html/index.html
              EOF
}
