This repository contains Terraform configurations to manage infrastructure, including Confluent Cloud Kafka topics. 
Actions will currently apply all the dev configurations.
## Structure

- `modules/`: Contains reusable Terraform modules.
- `environments/`: Contains environment-specific configurations.
- `.github/`: Contains GitHub Actions workflows.
- `scripts/`: Contains helper scripts for managing the infrastructure.

## Actions
PR to /test branches: init -> plan
Push to /test branches: init -> plan -> apply

## Local Usage

1. Navigate to the desired environment directory, e.g., `environments/dev`.
2. Run `terraform init` to initialize the Terraform configuration.
3. Run `terraform plan` to preview the changes.
4. Run `terraform apply` to apply the changes.

