# Terraform Azure Resource Group

This project demonstrates how to create Azure Resource Groups dynamically using Terraform with a generic and reusable infrastructure design.

The configuration uses:

- `for_each`
- `map(object)`
- Dynamic tags
- Generic Terraform code
- Dynamic outputs
- Scalable infrastructure approach

---

# Features

- Dynamic Azure Resource Group creation
- Generic and reusable Terraform code
- Resource creation using `for_each`
- Centralized input management through variables
- Dynamic tagging support
- Structured Terraform project layout
- Clean output exposure

---

# Project Structure

```text
terraform-azurerm-resource-group/
│
├── .terraform/
├── .terraform.lock.hcl
├── main.tf
├── variables.tf
├── terraform.tfvars
├── output.tf
├── provider.tf
├── version.tf
├── .gitignore
└── README.md
```

---

# Terraform Configuration

## Resource Group Resource

```hcl
resource "azurerm_resource_group" "this" {

  for_each = var.rgdetails

  name     = each.value.rg_name
  location = each.value.location
  tags     = each.value.tags
}
```

---

# Variable Definition

```hcl
variable "rgdetails" {
  description = "Map of Azure Resource Groups"
  type = map(object({
    rg_name  = string
    location = string
    managed_by  = optional(string)
    tags     = optional(map(string))
  }))
}
```

---

# Example Input

```hcl
rgdetails = {
  rg1 = {
    name  = "devrg1"
    location = "southindia"
    managed_by = "Terraform"
    tags = {
      env  = "dev"
      app  = "web"
      team = "infra"
    }
  }
  rg2 = {
    name  = "devrg2"
    location = "southindia"
    tags = {
      env  = "dev"
      team = "infra"
    }
  }
}
```

---

# Output Example

```hcl
output "rg_details" {

  description = "Details of created resource groups"

  value = {
    for k, v in azurerm_resource_group.this :
    k => {
      rg_id    = v.id
      rg_name  = v.name
      location = v.location
      tags     = v.tags
    }
  }
}
```

---

# Commands

## Initialize Terraform

```bash
terraform init
```

## Format Terraform Files

```bash
terraform fmt
```

## Validate Terraform Configuration

```bash
terraform validate
```

## Preview Infrastructure Changes

```bash
terraform plan
```

## Apply Infrastructure

```bash
terraform apply
```

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Concepts Demonstrated

This project demonstrates the following Terraform concepts:

- Terraform Resource Block
- Variables
- `map(object)`
- `for_each`
- Dynamic Infrastructure
- Output Values
- Generic Terraform Design
- AzureRM Provider
- Dynamic Tags
- Infrastructure Reusability

---

# Why This Project

The purpose of this project is to practice building scalable and reusable Terraform infrastructure while following clean coding and modular design principles commonly used in real-world DevOps environments.

---

# Future Improvements

Planned improvements for this project:

- Convert resource group configuration into reusable child modules
- Add virtual network module
- Add storage account module
- Implement multi-environment structure
- Configure remote backend
- Integrate CI/CD pipeline
- Add GitHub Actions

---

# Author

Sanjeev Kumar Singh

- DevOps & Terraform Learning Journey
- Azure Infrastructure Automation
- Infrastructure as Code Enthusiast