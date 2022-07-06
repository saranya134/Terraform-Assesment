terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "bsh-state-env"
    key            = "env/dev/web/terraform.tfstate"
    region         = "eu-central-1"

    # Replace thisa with your DynamoDB table name!
    dynamodb_table = "bosch-dynamodb-env"
    encrypt        = true
  }
} 

