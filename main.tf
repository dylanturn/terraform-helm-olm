resource "helm_release" "operator_lifecycle_manager" {
  name       = var.helm.operator_lifecycle_manager.name
  repository = var.helm.operator_lifecycle_manager.repository
  chart      = var.helm.operator_lifecycle_manager.chart
  version    = var.helm.operator_lifecycle_manager.version

  dynamic "set" {
    for_each = local.operator_lifecycle_manager_parameters
    content {
      name  = set.key
      value = set.value
    }
  }
}

resource "helm_release" "operator_subscription" {
  for_each = {
    for subscription in local.operator_subscription_parameters : subscription["name"] => subscription
  }

  name       = var.helm.operator_subscription.name
  repository = var.helm.operator_subscription.repository
  chart      = var.helm.operator_subscription.chart
  version    = var.helm.operator_subscription.version

  dynamic "set" {
    for_each = local.operator_subscription_parameters
    content {
      name  = set.key
      value = set.value
    }
  }
}