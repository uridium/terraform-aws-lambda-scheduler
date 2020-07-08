# Basic Lambda configuration

All what this example sets up is Lambda function and CloudWatch scheduler. No other components are involved.

## Usage

### Running Terraform

```bash
terraform init
terraform apply
```

## Notes

Given the attached example, your `code_directory` structure should look like this:

```bash
lambda
└── [drwxrwxr-x]  function
    └── [-rwxr-xr-x]  lambda.py
```

where file name (*lambda.py*) is `handler` prefix, and function name (*def handler()*) is `handler` suffix:

```hcl
handler = "lambda.handler"
```
