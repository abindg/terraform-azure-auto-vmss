client = "dsb"
environment = "dev"
resourcegroupname = "myrsg"
resourcegrouplocation = "eastus"
vnetname = "myvnet"
vnetaddress = ["10.0.0.0/16"]
webSubnetname = "myweb"
websubnetaddress = ["10.0.1.0/24"]
webnsg = "web-nsg1"
lb_pubipname = "lb_pub"
weblbname = "web_lb"
webvm_vmss_instance = 2
webvm_vmss_sec_ports = ["22", "80", "443"]
webvm_size = "Standard_B2s"
webvm_hostname = "web-vm"
webvm_user =  "adminuser"
webvm_password = "root@123"
cpumaxthreshhold = 70
cpuminthreshhold = 25
scale_value_down = 1
scale_value_up   = 1
capacity = {  
    weekday_profile = {
        default = 3
        minimum = 3
        maximum = 20
        days    = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        },
    weekend_profile = {
        default = 2
        minimum = 2
        maximum = 10
        days    = ["Saturday", "Sunday"]
        }
        }
default_capacity = {
     default = 1
     minimum = 1
     maximum = 6
    }