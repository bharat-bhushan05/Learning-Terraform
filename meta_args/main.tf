## Challenge 1: Create a Random Password (random provider)
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source = "hashicorp/local"
      version = "2.6.1"
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


resource "local_file" "user_file" {
  filename = var.user_filename
  content  = var.user_message
}

variable "user_filename" {
  type        = string
  description = "Enter the filename to create (e.g., output.txt)"
}

variable "user_message" {
  type        = string
  description = "Enter the message to write to the file"
}   

output "file" {
  value = "File name is ${local_file.user_file.filename}: Content is ${local_file.user_file.content}"  
}