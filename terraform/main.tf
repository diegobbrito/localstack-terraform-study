terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }
}
locals {
    env_variables               = { STAGE = "local" }
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

resource "aws_lambda_function" "presign_lambda" {
  function_name = "presign"
  handler       = "handler.handler"
  runtime       = "python3.11"
  timeout       = 10
  role          = ""
  environment {
    variables = local.env_variables
  }
}

resource "aws_lambda_function" "list_lambda" {
  function_name = "list"
  handler       = "handler.handler"
  runtime       = "python3.11"
  timeout       = 10
  role          = ""
  environment {
    variables = local.env_variables
  }
}

resource "aws_lambda_function" "resizer_lambda" {
  function_name = "resizer"
  handler       = "handler.handler"
  runtime       = "python3.11"
  timeout       = 10
  role          = ""
  environment {
    variables = local.env_variables
  }
}