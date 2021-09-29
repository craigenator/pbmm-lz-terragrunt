/**
 * Copyright 2019 Google LLC
 *
 * Copyright 2021 Google LLC. This software is provided as is, without
 * warranty or representation for any use or purpose. Your use of it is
 * subject to your agreement with Google.
*/

# Module specific arguments
variable "user_defined_string" {
  type        = string
  description = "User defined string for the service account, must a a unique value of lower-case letters or numbers with a maximum length of 20 characters."

  validation {
    condition     = can(regex("^[a-z0-9]{3,17}$", var.user_defined_string))
    error_message = "Must be lower-case letters or numbers with a maximum length of 17 characters. Min 3 characters."
  }
}

# Module specific local variables
locals {
  type = {
    "code"   = "sa"
    "parent" = "general"
  }

  device_type = "CLD"

  name_sections = {
    "user_defined_string" = var.user_defined_string,

    "set_case" = "lower",
  }
}