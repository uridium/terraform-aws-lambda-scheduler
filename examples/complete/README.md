# Complete Lambda configuration

This examples sets up a full-fledged Lambda function and CloudWatch scheduler. It also includes:

* Lambda layer
* VPC (subnets and security groups)
* X-Ray
* tags and variables

## Usage

### Creating Lambda layer

```bash
pip install -r lambda/requirements.txt -t lambda/layer/python
```

### Running Terraform

```bash
terraform init
terraform apply
```
