module "s3" {
  source                         = "./modules/s3"

  bucket_name                    = var.bucket_name
  iam_role_backup_uploader       = var.iam_role_backup_uploader
  retention_in_days              = var.retention_in_days
  standard_ia_transition_in_days = var.standard_ia_transition_in_days
}