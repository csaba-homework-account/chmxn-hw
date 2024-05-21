data "aws_iam_policy_document" "iam_policy_backup_uploader" {
  statement {
    actions   = [
        "s3:PutObject", 
        "s3:PutObjectAcl",
        "s3:GetObjectAcl",
        "s3:ListBucket"
        ]
    effect    = "Allow"
    resources = [
        "arn:aws:s3:::${var.bucket_name}/*"
        ]
    principals {
      type        = "AWS"
      identifiers = [
        var.iam_role_backup_uploader
        ]
    }
  }
}

resource "aws_s3_bucket_policy" "policy_att_backup_uploader" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.iam_policy_backup_uploader.json
}
