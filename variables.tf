variable "reg" {
  type        = string
  description = "Region"
  type        = string
  default     = ""
}
variable "bkt" {
  type        = string
  description = "Bucket Name"
  type        = string
  default     = ""

  validation {
    condition     = length(var.bkt) >= 3 && length(var.bkt) <= 63
    error_message = "Bucket names must be between 3 (min) and 63 (max) characters long"
  }

  validation {
    condition     = can(regex("^[a-z0-9.-]{1,64}$", var.bkt))
    error_message = "Bucket names can consist only of lowercase letters, numbers, dots (.), and hyphens (-)."
  }

  validation {
    condition     = can(regex("^[a-z0-9].*[a-z0-9]$", var.bkt))
    error_message = "Bucket names must begin and end with a letter or number"
  }

  validation {
    condition     = !strcontains(var.bkt, "..")
    error_message = "Bucket names must not contain two adjacent periods."
  }

  validation {
    condition     = !can(regex("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$", var.bkt))
    error_message = "Bucket names must not be formatted as an IP address (for example, 192.168.5.4)"
  }

  validation {
    condition     = !startswith(var.bkt, "xn--")
    error_message = "Bucket names must not start with the prefix xn--"
  }

  validation {
    condition     = !startswith(var.bkt, "sthree-")
    error_message = "Bucket names must not start with the prefix sthree-"
  }

  validation {
    condition     = !endswith(var.bkt, "-s3alias")
    error_message = "Bucket names must not end with the suffix -s3alias."
  }

  validation {
    condition     = !endswith(var.bkt, "--ol-s3")
    error_message = "Bucket names must not end with the suffix --ol-s3"
  }
}
