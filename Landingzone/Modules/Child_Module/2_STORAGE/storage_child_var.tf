variable "storage_child" {
    type = map(object({
        storage_name     = string
        rg_name = string
        location = string
        account_tier = string
        account_replication_type = string
    }))
}