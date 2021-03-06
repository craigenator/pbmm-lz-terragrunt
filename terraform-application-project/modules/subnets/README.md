# Terraform Network Module

This submodule is part of the the `terraform-google-network` module. It creates the individual vpc subnets.

It supports creating:

- Subnets within vpc network.

## Usage

Basic usage of this submodule is as follows:

```hcl
module "vpc" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "~> 2.0.0"

    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name               = "subnet-03"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "us-west1"
            subnet_flow_logs          = "true"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling = 0.7
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_user\_defined\_string | Additional user defined string. | `string` | `""` | no |
| department\_code | Code for department, part of naming module | `string` | n/a | yes |
| description | n/a | `string` | n/a | yes |
| environment | S-Sandbox P-Production Q-Quality D-development | `string` | n/a | yes |
| location | location for naming and resource placement | `string` | `"northamerica-northeast1"` | no |
| log\_config | n/a | <pre>object({<br>    aggregation_interval = optional(string)<br>    flow_sampling        = optional(number)<br>    metadata             = optional(string)<br>  })</pre> | n/a | yes |
| network\_name | The name of the network where subnets will be created | `any` | n/a | yes |
| project\_id | The ID of the project where subnets will be created | `any` | n/a | yes |
| secondary\_ranges | n/a | <pre>list(object({<br>    range_name    = string<br>    ip_cidr_range = string<br>  }))</pre> | n/a | yes |
| subnet\_ip | n/a | `string` | n/a | yes |
| subnet\_name | n/a | `string` | n/a | yes |
| subnet\_private\_access | n/a | `bool` | n/a | yes |
| subnet\_region | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnets | The created subnet resources |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Subnet Inputs

The subnets list contains maps, where each object represents a subnet. Each map has the following inputs (please see examples folder for additional references):

| Name                         | Description                                                                                                     |  Type  |         Default          | Required |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- | :----: | :----------------------: | :------: |
| subnet\_name                 | The name of the subnet being created                                                                            | string |            -             |   yes    |
| subnet\_ip                   | The IP and CIDR range of the subnet being created                                                               | string |            -             |   yes    |
| subnet\_region               | The region where the subnet will be created                                                                     | string |            -             |   yes    |
| subnet\_private\_access      | Whether this subnet will have private Google access enabled                                                     | string |        `"false"`         |    no    |
| subnet\_flow\_logs           | Whether the subnet will record and send flow log data to logging                                                | string |        `"false"`         |    no    |
| subnet\_flow\_logs\_interval | If subnet\_flow\_logs is true, sets the aggregation interval for collecting flow logs                           | string |    `"INTERVAL_5_SEC"`    |    no    |
| subnet\_flow\_logs\_sampling | If subnet\_flow\_logs is true, set the sampling rate of VPC flow logs within the subnetwork                     | string |         `"0.5"`          |    no    |
| subnet\_flow\_logs\_metadata | If subnet\_flow\_logs is true, configures whether metadata fields should be added to the reported VPC flow logs | string | `"INCLUDE_ALL_METADATA"` |    no    |
