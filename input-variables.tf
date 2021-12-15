variable "client" {
    description = "Client of TCS for which the resources are created"
    type = string  
}

variable "environment" {
    description = "the environment for which the resources are created"
    type = string
}

variable "resourcegroupname" {
    description = "Contains the resource group name"
    type = string
}

variable "resourcegrouplocation" {
    description = "Contains the resource group location" 
    type = string
}

variable "vnetname" {
    description = "Contains the vnet name suffix"
    type = string
}

variable "vnetaddress" {
    description = "Contains the vnet address range "
    type = list(string)
}

variable "webSubnetname" {
    description = "Contains the websubnet name suffix"
    type = string
}

variable "websubnetaddress" {
    description = "Contains the websubnet address range "
    type = list(string)
}


variable "webnsg" {
  description = "Contains name of web nsg"
  type = string
}


variable "lb_pubipname" {
    description = "Contains the lb pubip suffix"
    type = string  
}

variable "weblbname" {
    description = "Contains the weblb name suffix"
    type = string  
}

variable "webvm_vmss_instance" {
    description = "Contains the count of the Web-vms to be created"
    type = number  
}

variable "webvm_vmss_sec_ports" {
    description = "Contains the list of ports that are to be allowed for the vmss nsg"
    type = list(string)
  
}

variable "cpumaxthreshhold" {
    description = "Contains the maximum CPU threshold"
    type = number  
}

variable "cpuminthreshhold" {
  description = "Contains the minimum CPU threshold"
    type = number  
}

variable "scale_value_down" {
  description = "Contains the value of instance to which the vmss will be scaled down"
    type = number  
}

variable "scale_value_up" {
  description = "Contains the value of instance to which the vmss will be scaled up"
    type = number  
}

variable "capacity" {
    description = "Contains the map of capacities of recurrence autoscaling profile"
    type = any
}

variable "default_capacity" {
    description = "Contains the map of capacities of default autoscaling profile"
    type = map(string)
}

variable "webvm_size" {
    description = "Contains the size of each webvm in a vmss"
    type = string 
}

variable "webvm_hostname" {
    description = "Contains the hostname prefix of each webvm in a vmss"
    type = string 
}

variable "webvm_user" {
    description = "Contains the admin usernam of each webvm in a vmss"
    type = string 
}

variable "webvm_password" {
    description = "Contains the admin password of each webvm in a vmss"
    type = string 
}





