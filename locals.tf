locals {

  operator_lifecycle_manager_parameters = {
    "namespaces.management" = var.namespaces.management
    "namespaces.operator"   = var.namespaces.operator
  }

  operator_subscription_groups = ""



  operator_subscription_parameters = [for operator_group, subscription in var.operator_subscriptions : {
    name = subscription["name"]
    namespace = subscription["namespace"]
    channel = subscription["channel"]
    operator = subscription["operator"]
    source = subscription["operator"]
    source_namespace = subscription["operator"]
    install_plan_approval = subscription["operator"]
    config = subscription["config"]
    group = operator_group
  }]
}