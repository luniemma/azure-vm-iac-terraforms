resource_group = "demo-rg"
location       = "eastus"

vnet_name      = "demo-vnet"
address_space  = ["10.0.0.0/16"]

subnet_names   = ["subnet1", "subnet2"]
subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]

vm_names       = ["vm1", "vm2"]
vm_sizes       = ["Standard_B2s", "Standard_B2ms"]

admin_username = "azureuser"
# admin_password = "ComplexPassword!1234"
ssh_public_key_path = "~/.ssh/id_rsa.pub/ansiblekey.pub"   

