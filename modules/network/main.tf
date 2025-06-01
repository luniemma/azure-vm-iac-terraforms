resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.address_space
}
resource "azurerm_network_security_group" "main" {
  name                = "${var.vnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}
resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  count                 = length(var.subnet_names)
  subnet_id             = azurerm_subnet.subnets[count.index].id
  network_security_group_id = azurerm_network_security_group.main.id
}