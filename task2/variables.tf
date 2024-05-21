variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS Region"
}

variable "bucket_name" {
  type        = string
  default     = "example-bucket"
  description = "Bucket name"
}

variable "iam_role_backup_uploader" {
  type        = string
  default     = "arn:aws:iam::123456789012:role/backup_uploader"
  description = "The ARN of the role dedicated for backup pushes"
}

variable "retention_in_days" {
  type        = string
  default     = 180 
  description = "Specifies the number of days of data retention"
}

variable "standard_ia_transition_in_days" {
  type        = string
  default     = 90 
  description = "Specifies the number of days of data transition to Standard IA" 
}
