nic ={
    nic1 ={
        sbnet_name = "subnet1"
        vnet_name = "Apvnet"
        nic_name = "apnic"
        nic_loc = "West US"
        rg_name = "Appsrg01"
        ip_configuration ={
            ip1 ={
                name = "internal"
                private_ip_address_allocation = "Dynamic"
            }
        }
    }

    nic1 ={
        sbnet_name = "subnet2"
        vnet_name = "Apvnet"
        nic_name = "apnic2"
        nic_loc = "West US"
        rg_name = "Appsrg01"
        ip_configuration ={
            ip1 ={
                name = "internal"
                private_ip_address_allocation = "Dynamic"
            }
        }
    }
}