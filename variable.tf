variable "access_key_id" {
  description = "The access for authentication."
  type        = string
  sensitive   = true  # Mark as sensitive if the token should not be logged
}

variable "secret_access_key" {
  description = "The aws secret for authentication."
  type        = string
  sensitive   = true  # Mark as sensitive if the token should not be logged
}
