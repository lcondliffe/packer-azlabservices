terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "pkr_image_gallery" {
  name     = "pkr_image_gallery"
  location = "uksouth"
}

resource "azurerm_shared_image_gallery" "pkr_image_gallery" {
  name                = "pkr_image_gallery"
  resource_group_name = azurerm_resource_group.pkr_image_gallery.name
  location            = azurerm_resource_group.pkr_image_gallery.location
  description         = "Packer images for Azure Lab Services."

  tags = {
    Environment = "lab"
  }
}

resource "azurerm_shared_image" "example" {
  name                = "pkr-lab-win2019"
  gallery_name        = azurerm_shared_image_gallery.pkr_image_gallery.name
  resource_group_name = azurerm_resource_group.pkr_image_gallery.name
  location            = azurerm_resource_group.pkr_image_gallery.location
  os_type             = "Windows"

  identifier {
    publisher = "LukeWilliams"
    offer     = "Lab"
    sku       = "Lab"
  }
}