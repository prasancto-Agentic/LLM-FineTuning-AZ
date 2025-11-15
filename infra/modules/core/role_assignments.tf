# Role Assignments for ML Identity
resource "azurerm_role_assignment" "ml_keyvault_secrets" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = azurerm_user_assigned_identity.ml_identity.principal_id
}

resource "azurerm_role_assignment" "ml_contributor" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.ml_identity.principal_id
}

resource "azurerm_role_assignment" "ml_storage_contributor" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.ml_identity.principal_id
}

# Role Assignments for Function Identity
resource "azurerm_role_assignment" "function_keyvault_secrets" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}

resource "azurerm_role_assignment" "function_storage_reader" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_user_assigned_identity.function_identity.principal_id
}
