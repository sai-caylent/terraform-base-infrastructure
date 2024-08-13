variable "region" {
  type        = string
  description = "The region where the resources will be deployed."
  default     = "us-west-2"
}

variable "map_migrated_tag" {
  type        = string
  description = "The value of the MAP migrated tag used in all the resources (at provider level)."
}

variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}

variable "single_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

#### workspaces ##################
variable "bundle_id" {
  default     = "wsb-4qyzfv08r"
  type        = string
  description = "The ID of the bundle for the WorkSpace."
}
variable "compute_type_name" {
  default     = "VALUE"
  type        = string
  description = "The compute type. For more information, see Amazon WorkSpaces Bundles. Valid values are VALUE, STANDARD, PERFORMANCE, POWER, GRAPHICS, POWERPRO and GRAPHICSPRO."
}

variable "volume_encryption_key" {
  default     = null
  type        = string
  description = "The symmetric AWS KMS customer master key (CMK) used to encrypt data stored on your WorkSpace. Amazon WorkSpaces does not support asymmetric CMKs."
}

variable "root_volume_encryption_enabled" {
  default     = false
  type        = bool
  description = "Indicates whether the data stored on the root volume is encrypted."
}

variable "user_volume_encryption_enabled" {
  default     = false
  type        = bool
  description = "Indicates whether the data stored on the user volume is encrypted."
}

variable "user_volume_size_gib" {
  default     = 10
  type        = number
  description = "The size of the root volume."
}

variable "root_volume_size_gib" {
  default     = 80
  type        = number
  description = "The size of the root volume."
}

variable "running_mode" {
  default     = "AUTO_STOP"
  type        = string
  description = "The running mode. For more information, see Manage the WorkSpace Running Mode. Valid values are AUTO_STOP and ALWAYS_ON."
}

variable "running_mode_auto_stop_timeout_in_minutes" {
  default     = 60
  type        = number
  description = "The time after a user logs off when WorkSpaces are automatically stopped. Configured in 60-minute intervals."
}

variable "users" {
  type = list(string)
  default = [
    "localadmin"
  ]
  description = "The list of users to create WorkSpaces for."
}
