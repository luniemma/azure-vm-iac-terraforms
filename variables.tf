variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the VNet"
}

variable "subnet_names" {
  type        = list(string)
  description = "Subnet names"
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "Subnet CIDRs"
}

variable "vm_names" {
  type        = list(string)
  description = "Names of virtual machines"
}

variable "vm_sizes" {
  type        = list(string)
  description = "VM sizes for each VM"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VM"
}

# variable "admin_password" {
#   type        = string
#   sensitive   = true
#   description = "Admin password for VM"
# }
variable "nsg_ids" {
  description = "List of Network Security Group IDs to associate with subnets"
  type        = list(string)
  default     = []
}
variable "ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key for VM access"
}