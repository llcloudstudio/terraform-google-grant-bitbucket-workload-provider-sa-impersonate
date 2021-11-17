variable "bb_deployment_uuid" {
  description = "bitbucket deployment uuid"
  type        = string
}

variable "identity_pool_name" {
  description = "gcp identity pool name"
  type        = string
}

variable "service_account_name" {
  description = "gcp service account name to grant workload pool permissions to impersonate"
  type        = string
}
