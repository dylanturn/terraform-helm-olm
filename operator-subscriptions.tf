resource "helm_release" "operator_subscriptions" {
  depends_on = [
    helm_release.operator_lifecycle_manager
  ]
  for_each = {
    for subscriptions in var.operator_subscriptions : subscriptions["name"] => subscriptions
  }

  name       = each.value["name"]
  repository = var.helm.operator_subscription.repository
  chart      = var.helm.operator_subscription.chart
  version    = var.helm.operator_subscription.version
  namespace  = var.namespaces.operator

  values = [
    yamlencode({
      name                        = each.value["name"]
      lifecycle_manager_namespace = var.namespaces.management
      channel                     = each.value["channel"]
      operator                    = each.value["operator"]
      source                      = each.value["source"]
      install_plan_approval       = each.value["automatic_install_approval"] == true ? "Automatic" : "Manual"
      starting_csv                = each.value["starting_service_version"] == null ? "" : each.value["starting_service_version"]
    })
  ]
}
