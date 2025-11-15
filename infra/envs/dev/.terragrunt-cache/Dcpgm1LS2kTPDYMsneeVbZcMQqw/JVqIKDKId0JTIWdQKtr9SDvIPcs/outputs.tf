output "resource_group_id" {
  description = "ID of the resource group"
  value       = azurerm_resource_group.main.id
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.main.location
}

output "key_vault_id" {
  description = "ID of the Key Vault"
  value       = azurerm_key_vault.main.id
}

output "key_vault_name" {
  description = "Name of the Key Vault"
  value       = azurerm_key_vault.main.name
}

output "key_vault_uri" {
  description = "URI of the Key Vault"
  value       = azurerm_key_vault.main.vault_uri
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.main.id
}

output "ml_identity_id" {
  description = "ID of the ML managed identity"
  value       = azurerm_user_assigned_identity.ml_identity.id
}

output "ml_identity_client_id" {
  description = "Client ID of the ML managed identity"
  value       = azurerm_user_assigned_identity.ml_identity.client_id
}

output "function_identity_id" {
  description = "ID of the function app managed identity"
  value       = azurerm_user_assigned_identity.function_identity.id
}

output "function_identity_client_id" {
  description = "Client ID of the function app managed identity"
  value       = azurerm_user_assigned_identity.function_identity.client_id
}
