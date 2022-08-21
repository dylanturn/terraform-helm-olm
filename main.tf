resource "helm_release" "operator_lifecycle_manager" {
  name       = var.helm.name
  repository = var.helm.repository
  chart      = var.helm.chart
  version    = var.helm.version

  dynamic "set" {
    for_each = local.helm_parameters
    content {
      name  = set.key
      value = set.value
    }
  }
}