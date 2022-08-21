locals {
  helm_parameters = {
    "namespaces.management" = var.namespaces.management
    "namespaces.operator"   = var.namespaces.operator
  }
}