resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "backup"
    status = "Enabled"

    expiration {
      days = var.retention_in_days
    }

    noncurrent_version_expiration {
      noncurrent_days = var.retention_in_days
    }

    # Transitions to Standard Infrequent Access will push down costs over time
    transition {
      days            = var.standard_ia_transition_in_days
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = var.standard_ia_transition_in_days
      storage_class   = "STANDARD_IA"
    }
  }

  depends_on = [aws_s3_bucket_versioning.versioning]
}
