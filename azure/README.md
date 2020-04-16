## Cloud Resources - Azure
This sub-repo is for onboarding and maintaining resources on Azure.

## Resources maintained by Terraform modules
- [resource-group](https://github.com/abhioncbr/cloud-resources/tree/master/azure/modules/resource-group)
- [virtual-network](https://github.com/abhioncbr/cloud-resources/tree/master/azure/modules/virtual-network)

## Examples
- [resource-group](https://github.com/abhioncbr/cloud-resources/tree/master/azure/example/resource-group)
- [virtual-network](https://github.com/abhioncbr/cloud-resources/tree/master/azure/example/virtual-network)

## commands for trying example
```bash
cd cloud-resources/azure/examples/<resource-type>

terraform init
terraform plan -var-file=<variable-files-tfvars>
terraform apply -var-file=<variable-files-tfvars>       # for creation of resources
terraform destroy -var-file=<variable-files-tfvars>     # for destroying of resources
```