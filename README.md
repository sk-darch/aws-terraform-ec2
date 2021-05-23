AWS Terraform IaC

    AWS Infrastructure as Code(IaC) using terraform to lunch a ec2 instance in Custom VPC.

Modules:-

    1) Versions.tf - Terraform and Provider versions maintained in this file so that we can lock our CLI tools version with specific major version.

    2) Variables.tf - This file containes environment variable are being used in this template

    3) Vpc.tf - I have created custom template for VPC, Subnet, Network Interface, Internet Gateway, Route tables & security Groups.

    4) Lunch-ec2.tf - EC2 instance lunch templated maintained this file.