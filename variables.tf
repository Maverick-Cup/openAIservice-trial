variable "location" {
  description = "Depicts the Location of resource in context."
  default     = "eastus"
  type        = string
}

variable "subscription" {
  description = "The Subs to be used for putting all resouces under."
  default     = "your subs name"
  type        = string
}

variable "subscription_id" {
  description = "The Subs ID to be used for corresponding Subs name used above."
  default     = "your subs id"
  type        = string

}
variable "rg_name" {
  description = "Depicts the name of the resource group in context."
  default     = ""
  type        = string
}
variable "sa_name" {
  description = "Depicts the name of the Storage account in context."
  default     = ""
  type        = string
}

variable "storage_account_kind" {
  description = "(Optional) Specifies the account kind of the storage account."
  default     = "BlockBlobStorage"
  type        = string

  validation {
    condition     = contains(["BlobStorage", "BlockBlobStorage", "FileStorage", "Storage V2", "Storage"], var.storage_account_kind)
    error_message = "The current storage kind is not valid, please check the expected value. Refer article to know more https://www.reddit.com/r/AZURE/comments/xe5iai/location_not_valid_error_when_applying_terraform/"
  }
}

variable "storage_account_tier" {
  description = "(Optional) Depics the name of the account tier of the storage account."
  default     = "Standard"
  type        = string

  validation {
    condition     = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "The current account tier of the storage account is invalid. Please check expected value."
  }
}

variable "storage_account_replication_type" {
  description = "(Optional) Specifies the replication type of the storage account for DR/HA purpose."
  default     = "LRS"
  type        = string

  validation {
    condition     = contains(["LRS", "ZRS", "GRS", "GZRS", "RA-GRS", "RA-GZRS"], var.storage_account_replication_type)
    error_message = "Depicts the replication type of the storage account is invalid. Please check expected value."
  }
}

variable "container_name" {
  description = "Depicts the name of the container in context"
  default     = ""
  type        = string
}

variable "tags" {
  description = "Depicts the name of the tags variable for all resources in context"
  default = {
    createdwith = "Terraform pipeline"
  }
}
variable "deployment_name" {
  description = "Depicts the Deployment type/name"
  type        = string
  default     = ""
}

variable "ai_search_name" {
  description = "Depicts the name of AI Search."
  default     = ""
  type        = string
}

variable "ai_search_sku" {
  description = "Depicts the SKU of AI Search."
  default     = "standard"
  type        = string
}

variable "openai_name" {
  description = "(Required) Depicts the name of the OpenAI Service name."
  type        = string
  default     = ""
}

variable "openai_sku_name" {
  description = "(Optional) Depicts the SKU type of the OpenAI Service."
  type        = string
  default     = "S0"
}

variable "openai_public_network_access_enabled" {
  description = "(Optional) Specifies if public network access from in to out is enabled or not."
  type        = bool
  default     = true
}