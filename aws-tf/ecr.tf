resource "aws_ecr_repository" "foo" {
  name                 = "${var.project_name}-ecr"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "${var.project_name}-ecr"
  }
}