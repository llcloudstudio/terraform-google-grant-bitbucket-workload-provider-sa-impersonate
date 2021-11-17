# Allow a Workload Identity Pool Provider to Impersonate a Named Service Account

This module will configure an existing workload identity pool provider so that it is allowed to impersonate a service account. 
* Specific to Bitbucket pipelines, and requires the deployment_uuid, as only that id will be granted impersonation.
* To get your deployment_uuid, access your Bitbucket Cloud repository and navigate to repository -> repository settings -> openid connect -> select deployment -> record uuid
* Service Account must already exist. 
* Workload Identity Pool Provider must already exist. See module "bitbucket-identity-pool-provider"
* Workload Identity Pool must already exist. See module "bitbucket-workload-identity-pool"


## Quick start

To use this module: 

1. In your main.tf include the following: 
```
module "grant_bitbucket_workload_provider_sa_impersonate" {
  source               = "grant-bitbucket-workload-provider-sa-impersonate"
  service_account_name = "google_service_account.name"
  identity_pool_name   = "identity_pool.name"
  bb_deployment_uuid   = "bb_deployment_uuid"
}
```
1. Run terraform validate and fix any issues that appear.    
1. Run terraform plan and confirm you are ok with what will be deployed.   
1. Run terraform apply to have the resources deployed.
