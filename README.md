# discourse-installation-AWS

1. Generate ssh key.
Example: `ssh-keygen -f terraform/mykey`

2. Create `terraform.tfvars` after the template `tfvars.txt`, enter your credentials.

3. Run `cd terraform; terraform init`

4. Run `terraform apply`
