locals {
  principalSet1 = "principalSet://iam.googleapis.com/${var.identity_pool_name}/attribute.deploymentenvironmentuuid/{${var.bb_deployment_uuid}}"
}

# Define service account IAM policy, and who can impersonate this account.
data "google_iam_policy" "admin" {
  binding {
    members = [
      local.principalSet1,
    ]
    role = "roles/iam.serviceAccountTokenCreator"
  }
  binding {
    members = [
      local.principalSet1,
    ]
    role = "roles/iam.serviceAccountUser"
  }
  binding {
    members = [
      local.principalSet1,
    ]
    role = "roles/iam.workloadIdentityUser"
  }
}

# Apply IAM policy to service account.
resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = var.service_account_name
  policy_data        = data.google_iam_policy.admin.policy_data
}
