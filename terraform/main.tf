locals {
    images_bucket         = "localstack-thumbnails-app-images"
    image_resized_bucket  = "localstack-thumbnails-app-resized"
}

# S3
resource "aws_s3_bucket" "images_bucket" {

  bucket = local.images_bucket
}

resource "aws_s3_bucket" "image_resized_bucket" {
  bucket = local.image_resized_bucket
}