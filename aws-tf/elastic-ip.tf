resource "aws_eip" "ec2-eip" {
  domain = "vpc"

  instance   = aws_instance.ec2.id
  depends_on = [aws_internet_gateway.igw]
}

# Associate the Elastic IP with the EC2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.ec2-eip.id
}