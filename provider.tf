terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.00"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-openAISvc-sndbx-eastus"
    storage_account_name = "sasndbxtfstate"
    #storage_account_id = "sasndbxtfstate"
    container_name = "tfstate" #Check green ticked answer @ https://stackoverflow.com/questions/77388978/failed-to-get-existing-workspaces-containers-clientlistblobs-code-containern
    key            = "terraform.tfstate"
    #access_key      = "Navigate to your Storage account keys section in Azure to find this if needed based on real time error" 
    tenant_id       = ""
    subscription_id = ""
  }
}

provider "azurerm" {
  features {}
  #alias           = "new"
  subscription_id = "your subs id"
  #terraform import azurerm_resource_group.rg /subscriptions/7700f392-dcd5-4c02-9432-76a162f3c6d6/resourceGroups/rg-openAISvc-sndbx-eastus
}
