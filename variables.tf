# The attributes of this object will become optional with inline defaults once Terraform 1.3.0 is released.
variable "helm" {
  type = object({
    operator_lifecycle_manager = object({
      name       = string
      chart      = string
      version    = string
      repository = string
    })
    operator_subscription = object({
      name       = string
      chart      = string
      version    = string
      repository = string
    })
  })
  description = "An object that allows for the configuration of the helm chart used to deploy the lifecycle manager and operator subscriptions"
  default = {
    operator_lifecycle_manager = {
      name       = "operator-lifecycle-manager"
      chart      = "./charts/operator-lifecycle-manager"
      version    = "0.22.0"
      repository = null
    }
    operator_subscription = {
      name       = "operator-lifecycle-manager"
      chart      = "./charts/operator-subscription"
      version    = "0.0.1"
      repository = null
    }
  }
}

variable "namespaces" {
  type = object({
    management = string
    operator   = string
  })
  description = "An object that defines the namespaces of the lifecycle management operator as well as other subscribed operators."
  default = {
    management = "olm"
    operator   = "operators"
  }
}

# The attributes of this object will become optional with inline defaults once Terraform 1.3.0 is released.
variable "operator_subscription_groups" {
  type = list(object({
    group_name = string
    group_namespace = string
    group_upgrade_strategy = string
    group_subscriptions = list(object({
      name = string
      operator = string
      channel = string
      source = string
      starting_service_version = string
      automatic_install_approval = bool
      config = any
    }))
  }))
  description = <<EOT
  PUT DESCRIPTION HERE
  EOT
  default = []
}

# The attributes of this object will become optional with inline defaults once Terraform 1.3.0 is released.
variable "operator_subscriptions" {
  type = list(object({
    name = string
    namespace = string
    operator = string
    channel = string
    source = string
    starting_service_version = string
    automatic_install_approval = bool
    config = any
  }))
  description = "A map of {operator_group => subscription_config}"
  default = {}
}