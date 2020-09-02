# Basic Lambda configuration

All what this example sets up is Lambda function and CloudWatch scheduler. No other components are involved.
Also, this example contains `remote-state` directory which provieds locking mechanism to prevent concurrent runs against the same state. Locking helps make sure that only one team member at a time runs terraform configuration.

## Usage

### Running Terraform

#### Set up remote state

Go to `remote-state` directory:

```bash
cd remote-state
terraform init
terraform apply
```

#### Set up lambda resources

Go to the previous directory:

```bash
cd ..
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
