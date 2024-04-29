resource "aws_s3_bucket" "bktCreate" {
  bucket = var.bkt
  tags = {
    Environment        = "${local.environment}"
    AppName            = "${local.appname}"
    Backup             = "${local.backup}"
    BusinessUnit       = "${local.businessunit}"
    DataClassification = "${local.dataclassification}"
  }
}
