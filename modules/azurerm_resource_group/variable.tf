variable "rgs" {
    type = map(object({
        name = string
        location = string
        managed_by = optional(string,"Not assigned")
        tags = optional(map(string),
        {
            owner = "Apps"
            team = "AP"
        })
    }))
  
}