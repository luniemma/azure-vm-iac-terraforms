terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
module "vm" {
  source              = "./modules/vm"
  count               = length(var.vm_names)
  resource_group      = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vm_name             = var.vm_names[count.index]
  vm_size             = var.vm_sizes[count.index]
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.network.subnet_ids[count.index % length(module.network.subnet_ids)]
  nsg_name            = "${var.vm_names[count.index]}-nsg"
  public_ip_name      = "${var.vm_names[count.index]}-pip"
  ssh_public_key_path = var.ssh_public_key_path
}



module "network" {
  source          = "./modules/network"
  resource_group  = azurerm_resource_group.main.name
  location        = azurerm_resource_group.main.location
  vnet_name       = var.vnet_name
  address_space   = var.address_space
  subnet_names    = var.subnet_names
  subnet_prefixes = var.subnet_prefixes
  
  # Pass in NSG from vm module here if needed (for the first VM as example)
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group
  location = var.location
}
