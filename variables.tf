# The attributes of this object will become optional with inline defaults once Terraform 1.3.0 is released.
variable "helm" {
  type = object({
    name       = string
    chart      = string
    version    = string
    repository = string
  })
  description = "ADD DESCRIPTION"
  default = {
    name       = "operator-lifecycle-manager"
    chart      = "./chart"
    version    = "1.0.0"
    repository = null
  }
}

variable "namespaces" {
  type = object({
    management = string
    operator   = string
  })
  description = "ADD DESCRIPTION"
  default = {
    management = "olm"
    operator   = "operators"
  }
}