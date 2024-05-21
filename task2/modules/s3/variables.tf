variable "bucket_name" {
  type        = string
  description = "Bucket name"
}

variable "iam_role_backup_uploader" {
  type        = string
  description = "The ARN of the role dedicated for backup pushes"
}

variable "retention_in_days" {
  type        = string
  description = "Specifies the number of days of data retention"
}

variable "standard_ia_transition_in_days" {
  type        = string
  description = "Specifies the number of days of data transition to Standard IA" 
}
