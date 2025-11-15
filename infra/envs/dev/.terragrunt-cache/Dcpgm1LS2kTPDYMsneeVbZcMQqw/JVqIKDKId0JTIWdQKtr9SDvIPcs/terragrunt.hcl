locals {
  env_name = "dev"
}

# Include the root configuration
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Configure Terraform to use the core module
terraform {
  source = "${get_parent_terragrunt_dir()}/modules/core"
}

# Pass variables to the module
inputs = {
  environment                 = local.env_name
  location                    = "southindia"
  resource_prefix             = "${local.env_name}-llm-ft"
  resource_group_name         = "${local.env_name}-llm-ft-rg"
  key_vault_name              = "${local.env_name}-llm-ft-kv"
  log_analytics_workspace_name = "${local.env_name}-llm-ft-law"
  tags = {
    Environment = "Development"
    Project     = "LLM-FT"
    ManagedBy   = "Terraform"
    Owner       = ""  # Add your name or team name here
  }
}
