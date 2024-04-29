locals {
  environment        = "preprod"
  appname            = var.bkt
  backup             = "no"
  businessunit       = "infra"
  dataclassification = "internal"
  regN               = var.reg == "us-east-1" ? "nv" : "oh"
}

resource "aws_s3_bucket" "bktCreate" {
  bucket = "${local.businessunit}-${local.environment}-${local.regN}-${local.appname}-storage"
  tags = {
    Environment        = "${local.environment}"
    AppName            = "${local.appname}"
    Backup             = "${local.backup}"
    BusinessUnit       = "${local.businessunit}"
    DataClassification = "${local.dataclassification}"
  }
}
