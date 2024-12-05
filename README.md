# Azure OpenAI and Azure AI Search Deployment with Terraform
## I highly recommend and suggest that you write each line by yourself to learn better, if you're just getting started with TF/Git etc. . 

This Terraform configuration deploys an AI solution on Azure, including:
- ##Do check References section before getting started :) ##
- Azure Resource Group
- Azure Cognitive Search service
- Azure OpenAI resource for deploying ChatGPT 4o LLM model
- Azure Storage Account and Storage Container

## Prerequisites

Install the following before you start:
- [Terraform](https://www.terraform.io/downloads.html) TF version is 1.10.1 and AzureRM version is 4.12 after updating using the command terraform init -upgrade
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

Please ensure you have the Contributor permissions at the least to be able to create resources. If you're using Azure with Contributor role then you won't be able to create locks on resources or create backup, you'll need higher roles 

## Terraform Configuration Overview

This setup creates the following resources:
- Resource Group
- Azure Cognitive Search
- Azure OpenAI Cognitive Account
- Azure Storage Account and Container

## Provider Configuration

The `provider.tf` file configures the Azure provider and backend for state management:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.00"
    }
  }
  backend "azurerm" {
    resource_group_name   = "change as you like"
    storage_account_name  = "change as you like"
    container_name        = "change as you like"
    key                   = "change as you like"
  }
}

provider "azurerm" {
  features {}
}
```

This ensures that the Terraform state is stored in an Azure Blob Storage container for remote state management.

## Setup Instructions
1. Clone the Repository to your local direcotory - 
   
   ```bash
   git clone [https://github.com/Maverick-Cup/openAIservice-trial]
   cd local_directory
   ```
2. Edit a terraform.tfvars file with the your choice values:

```hcl
rg_name         = "change as you like"
ai_search_name  = "change as you like"
openai_name     = "change as you like"
sa_name         = "change as you like"
container_name  = "change as you like"
location        = "eastus"
deployment_name = "chatgpt4o"
```
3. Initialize Terraform
   
   ```bash
   terraform init -reconfigure
   ```
4.  Review and Apply the Plan

   ```bash
   terraform plan
   terraform apply
```

## File Structure

```plaintext
.
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Variable definitions
├── provider.tf             # Provider and backend configuration
├── terraform.tfvars        # Variable values
├── .gitignore              # Git ignore file
└── README.md               # This readme file
```

## References
- Debug errors & understanding reason
- [A] SA Container name should be tfstate , issue is not due to the key but due to the way  https://stackoverflow.com/questions/77388978/failed-to-get-existing-workspaces-containers-clientlistblobs-code-containern
- [B] Some usefull TF commands:
- [1] terraform import azurerm_resource_group.rg /subscriptions/your_subs_id/resourceGroups/rg-openAISvc-sndbx-eastus
- [2] terraform state list - To help you see which resource is pending to be added in the State file, add it and then run;
- [3] terraform init -reconfigure
- [4] TF version is 1.10.1 and AzureRM version is 4.12 after updating using the command terraform init -upgrade
- Model's SKU is commmented as the version of the model can give issues, so commented it, should be working fine like this also.

- [Azure OpenAI Service](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/overview)
- [Azure Cognitive Search](https://learn.microsoft.com/en-us/azure/search/search-what-is-azure-search)
