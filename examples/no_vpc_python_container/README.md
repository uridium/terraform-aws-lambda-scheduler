# Simple Lambda configuration

All what this example sets up is a containerized Lambda function and CloudWatch scheduler. No other components are involved.

## Usage

### Exporting variables

```bash
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-east-1
```

### Running Terraform

```bash
terraform init
terraform apply
```

## Notes

ECR credentials are set up using _docker_ provider and _aws_ecr_authorization_token_ data source.

If you need to authenticate your local CLI environment, you can run:

```bash
region=$(aws configure get region)
aws_account_id=$(aws sts get-caller-identity --query Account --output text)

aws ecr get-login-password --region ${region} | docker login -u AWS --password-stdin ${aws_account_id}.dkr.ecr.${region}.amazonaws.com
```
