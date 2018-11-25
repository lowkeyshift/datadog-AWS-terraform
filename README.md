# datadog-AWS-terraform

## Description
This repo is used as a starting template for deploying an ubuntu AIM to your AWS account. This will also create generate a new [Timeboard])https://docs.datadoghq.com/graphing/dashboards/timeboard/) and [Monitor](https://docs.datadoghq.com/monitors/) within [Datadog](https://www.datadoghq.com/) for that new EC2 instance.

## Requirements

This template as been tested using the following versions
```
Terraform v0.11.10
+ provider.aws v1.45.0
+ provider.datadog v1.5.0
```
- [terraform](https://www.terraform.io/intro/getting-started/install.html#installing-terraform)

Make sure to complete the install of `aws-vault` by setting up your `~/.aws/config` more information can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files)
- [aws-vault](https://github.com/99designs/aws-vault#installing)

## Typical Commands

1. Clone this repo as your working directory and initialize terraform. This will install the required provider plugins.
```bash
cd datadog-AWS-terraform/
terraform init
```
2. Update the fields in the `variable.tf` file to reflect your AWS/Datadog accounts there are links in the comments.
3. To test if a terraform run will be successful use `plan`
```bash
aws-vault exec <role from ~/.aws/config> terraform plan
```
4. To `apply` a successful `plan` you can run this command.
```bash
aws-vault exec <role from ~/.aws/config> terraform apply
```
