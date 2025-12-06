## Challenge 1: Create a Random Password (random provider)
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

resource "random_password" "mypwd" {
  length = var.pwd_length
}
variable "pwd_length" {
  type = number
  default = 9
}

output "generated_password" {
  value     = random_password.mypwd.result
  sensitive = true
}


##🧩 Challenge 2: Create a local file from user input (local provider)
# Requirement:
# Ask user for filename
# Ask user for message
# Create file dynamically using local_file