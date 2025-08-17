#Install Terraform → Terraform Download
#Install Azure CLI (az login)
root@MyVM:~# az ad sp create-for-rbac --name "terraform-sp" \
  --role Contributor \
  --scopes /subscriptions/subscriptionid

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"   # pick latest stable
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" # replace with your subscription ID
  client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" # (Service Principal App ID)
  client_secret   = "xxxxxxxxxxxxxxxxxxxxxxxx"             # (Service Principal Secret)
  tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

# Resource Group (similar to AWS account grouping)
resource "azurerm_resource_group" "this" {
  name     = "rg-terraform"
  location = "East US"
}

# Virtual Network (similar to AWS VPC)
resource "azurerm_virtual_network" "this" {
  name                = "vnet-terraform"
  address_space       = ["10.30.0.0/16"] # same CIDR as your AWS VPC
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

