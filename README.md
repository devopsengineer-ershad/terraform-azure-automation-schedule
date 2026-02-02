Terraform Azure Automation Schedule
🔻 Cost Optimization using Scheduled Automation

This repository provisions Azure Automation Schedules using Terraform to enable cost optimization through scheduled resource management (for example, nightly VM cleanup).

It follows a modular, multi-environment, production-ready Terraform design suitable for real-world Azure workloads.

📌 Key Features

💰 Cost optimization through scheduled automation

📦 Modular Terraform design

🌍 Multi-environment structure (dev, prod, etc.)

🔁 Supports multiple automation schedules

✅ Deterministic and reusable child modules

🧱 Repository Structure
terraform-azure-automation-schedule/
├── modules/
│   ├── resource_group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── automation_account/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── automation_runbook/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── automation_schedule/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── automation_job_schedule/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
└── README.md

🧠 Design Philosophy

Each environment (dev, prod) is an independent root module

Environment configuration controls when automation runs

Child modules focus only on resource creation

Enables safe, repeatable cost-optimization workflows