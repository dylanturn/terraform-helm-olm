resource "helm_release" "operator_lifecycle_manager" {
  name       = var.helm.operator_lifecycle_manager.name
  repository = var.helm.operator_lifecycle_manager.repository
  chart      = var.helm.operator_lifecycle_manager.chart
  version    = var.helm.operator_lifecycle_manager.version

  set {
    name  = "namespaces.management"
    value = var.namespaces.management
  }
  set {
    name  = "namespaces.operator"
    value = var.namespaces.operator
  }
}