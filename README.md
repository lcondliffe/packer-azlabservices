# Packer Images for Azure Lab Services
Example Packer builds for Azure Lab Services environment.

## Pre-Requisites

### Image Gallery Pre-Staging
___
When pushing to an Azure Shared Image Gallery, AzureRM/Packer requires that an image is already pre-staged before build versions can be pushed. The included Terraform configuration automates this including the provisioning of an image gallery called 'pkr_image_gallery'.

### Azure CLI
___
This Packer configuration authenticates to Azure via the Azure CLI, this must be installed and logged in to grant access to your Azure cloud subscriptions. The included Terraform configuration also uses this authentication method to provision the image gallery resources.

Alternative authentication methods are available:
https://www.packer.io/docs/builders/azure#authentication-for-azure

### Ansible
___
This Packer configuration demonstrates using an Ansible playbook to reach out and configure the VM. You must have Ansible installed at runtime for this provisioner to work successfully.

## Usage

Build the Image Gallery and pre-stage image:

`cd terraform`

`terraform init`

`terraform plan`

`terraform apply`

Build image with Packer:
`packer build --var-file=example_vars.json lab-base.json`

### Sources
https://www.packer.io/docs/provisioners/ansible

https://github.com/hashicorp/packer/issues/7809#issuecomment-546985800

https://www.packer.io/docs/builders/azure#authentication-for-azure
