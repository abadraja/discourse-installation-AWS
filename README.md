# discourse-installation-AWS

This will let you create an AWS EC2 instance with preinstalled [Discourse](https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md).

1. Generate ssh key.
Example: `ssh-keygen -f terraform/mykey`

2. Create `terraform.tfvars` after the template `tfvars.txt`, enter your credentials.

3. Run `cd terraform; terraform init`

4. Run `terraform apply`
