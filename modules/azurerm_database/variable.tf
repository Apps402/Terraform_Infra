variable "sql" {
    type = map(object({
        sql_server_name = string
        rg_name = string
        location =  "West US"
        
    }))
  
}