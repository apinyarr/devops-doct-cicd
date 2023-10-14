variable "region" {
    description = "aws region"
    type = string
    default = "ca-central-1"
}

variable "create_linux_runner" {
    description = "to enable or disable linux_runner"
    type = bool
    default = true
}

variable "create_windows_runner" {
    description = "to enable or disable windows_runner"
    type = bool
    default = true
}

# variable "ops_pre_peering" {
#     description = "vpc peering between ops and pre"
#     type = string
#     default = "pcx-06d415c4776e50a9c"
# }