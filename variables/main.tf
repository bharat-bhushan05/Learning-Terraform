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

# resource "random_password" "mypwd" {
#   length = var.pwd_length
# }
# variable "pwd_length" {
#   type = number
#   default = 9
# }

# output "generated_password" {
#   value     = random_password.mypwd.result
#   sensitive = true
# }


##🧩 Challenge 2: Create a local file from user input (local provider)
# Requirement:
# Ask user for filename
# Ask user for message
# Create file dynamically using local_file


# resource "local_file" "user_file" {
#   filename = var.user_filename
#   content  = var.user_message
# }

# variable "user_filename" {
#   type        = string
#   description = "Enter the filename to create (e.g., output.txt)"
# }

# variable "user_message" {
#   type        = string
#   description = "Enter the message to write to the file"
# }   

# output "file" {
#   value = "File name is ${local_file.user_file.filename}: Content is ${local_file.user_file.content}"  
# }


# Challenge 3: Create 3 files using list variable
# Requirement:
# Create a list variable containing 3 filenames
# Use for_each loop on local_file resource
# Each file should contain text "Hello Terraform"

variable "file_list" {
  type        = list(string)
  description = "List of filenames to create"
  default     = ["file1.txt", "file2.txt", "file3.txt"]
}
resource "local_file" "multiple_files" {
  for_each = toset(var.file_list)
  filename = each.value
  content  = "Hello Terraform from ${each.value}"
}

output "multiple_files_output" {
  value = { for k, v in local_file.multiple_files : k => "${v.content}" }   

}