This repository contains Terraform configurations to manage infrastructure, including Confluent Cloud Kafka topics.

## Structure

- `modules/`: Contains reusable Terraform modules.
- `environments/`: Contains environment-specific configurations.
- `.github/`: Contains GitHub Actions workflows.
- `scripts/`: Contains helper scripts for managing the infrastructure.

## Usage

1. Navigate to the desired environment directory, e.g., `environments/dev`.
2. Run `terraform init` to initialize the Terraform configuration.
3. Run `terraform plan` to preview the changes.
4. Run `terraform apply` to apply the changes.

