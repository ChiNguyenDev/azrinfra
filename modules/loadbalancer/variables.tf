variable "tags" {
  nullable    = false
  description = "(optional) tags for the Azure resources"
  type        = map(string)
}

variable "location" {
  nullable    = false
  description = "(required) location for Azure resources"
  type        = string
  default     = "West Europe"
}

variable "resource_group" {
  nullable    = false
  description = "(required) resource group for Azure resources"
  type        = string
}

variable "naming" {
  description = "Naming module object"
}

variable "configuration" {
    nullable = false
    description = "This is the configuration for the load balancer"
    type = object({
        sku = string
        frontend_ip_configuration = object({
          name = optional(string, "ip_config1")
        })
        public_ip = object({
          allocation_method = optional(string, "Static")
          sku = string
        })
        backendpool = object({
          name = string
        })
        probe = object({
          name = string
          port = number
        })
        lb_rule = map(object({
          name = string
          protocol = optional(string, "Tcp")
          frontend_port = number
          backend_port = number
        }))
    })
}


variable "nic_reference" {
    nullable = false
    description = "(required) this is the reference for the NIC of the vm's"
    type = map(object({
        id = string
        ip_config_name = string
    }))
}