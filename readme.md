# Creating a Data Service with Cloud Foundry Terraform Provider
Besides the STACKIT portal, you can deploy data services using the [Cloud Foundy Terraform Provider](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs).

## Prerequisites
1. A STACKIT [customer account](https://www.stackit.de/en/contact).
1. The [Cloud Foundry cli](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html).

## Steps
1. Create a new STACKIT project (https://portal.stackit.cloud).
1. Initialize your terraform environment:
    ```shell
    terraform init
    ```
1. Update ```terraform.tfvars``` with your Cloud Foundry org and space (see ```cf login -a https://api.system.01.cf.eu01.stackit.cloud --sso```).
1. Get an [CF SSO passcode](https://login.system.01.cf.eu01.stackit.cloud/passcode).
1. Create the service instance:
    ```shell
    $ export CF_SSO_PASSCODE=redacted
    $ terraform apply
    ```
1. Retrieve the service credentials:
    ```shell
    $ cf service-key mylittlepg key1
    ```