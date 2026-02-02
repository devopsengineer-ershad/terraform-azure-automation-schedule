🚀 Terraform Azure Automation Schedule
🔻 Cost Optimization using Scheduled Automation

💡 This repository provisions Azure Automation Schedules using Terraform to achieve cost optimization through scheduled resource management — for example, nightly VM cleanup, shutdowns, or resource housekeeping.

It follows a modular, multi-environment, production-ready Terraform architecture suitable for real-world Azure workloads.

✨ Why This Repo?

💰 Stop paying for idle Azure resources. Automate cleanup. Save costs.

This project demonstrates how to:

Schedule automation tasks

Enforce cost-saving policies

Maintain clean, reusable Terraform modules

📌 Key Features

💰 Cost optimization via scheduled automation

📦 Fully modular Terraform design

🌍 Multi-environment support (dev, prod, etc.)

🔁 Multiple automation schedules support

🧠 Deterministic & reusable child modules

🏗️ Production-grade dependency orchestration


## 🧱 Repository Structure

```text
terraform-azure-automation-schedule/
├── modules/
│   ├── resource_group/              # Azure Resource Groups
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── automation_account/           # Azure Automation Account
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── automation_runbook/           # Automation Runbooks
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── automation_schedule/          # Automation Schedules
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── automation_job_schedule/      # Runbook ↔ Schedule binding
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── environments/
│   └── dev/                          # Environment root module
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
└── README.md



🔁 Automation Execution Flow
Resource Group
      ↓
Automation Account
      ↓
Automation Runbook
      ↓
Automation Schedule
      ↓
Automation Job Schedule


✔ Enables nightly cleanup jobs
✔ Perfect for cost optimization strategies

🧠 Design Philosophy

🌍 Each environment (dev, prod) is an independent root module

🎛️ Environment configuration controls when automation runs

🧩 Child modules focus only on resource creation

🔐 Ensures safe, predictable, and repeatable automation

💰 Designed specifically for cost-optimization workflows