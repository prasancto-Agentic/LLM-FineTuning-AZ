# Managed Identity for ML
resource "azurerm_user_assigned_identity" "ml_identity" {
  name                = "${var.resource_prefix}-ml-identity"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.tags
}

# Managed Identity for Function App
resource "azurerm_user_assigned_identity" "function_identity" {
  name                = "${var.resource_prefix}-function-identity"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.tags
}
