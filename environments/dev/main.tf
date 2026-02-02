module "resource_group" {
  source = "../../modules/resource_group"
  rgs = var.rgs 
}

module "automation_account" {
  source = "../../modules/automation_account"
  automation_account = var.automation_account
  depends_on = [module.resource_group]
}

module "automation_runbook" {
  source = "../../modules/automation_runbook"
  automation_runbook = var.automation_runbook
  depends_on = [module.automation_account]
}

module "automation_schedule" {
  source = "../../modules/automation_schedule"
  automation_schedule = var.automation_schedule
  depends_on = [module.automation_account]
  
}

module "automation_job_schedule" {
  source = "../../modules/automation_job_schedule"
  job_schedule = var.job_schedule
  depends_on = [module.automation_runbook, module.automation_schedule]
}


