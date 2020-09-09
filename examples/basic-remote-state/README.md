# Basic Lambda configuration

All what this example sets up is Lambda function and CloudWatch scheduler. No other components are involved.
Also, this example contains *remote-state* directory which provieds locking mechanism to prevent concurrent runs against the same state. Locking helps make sure that only one team member at a time runs terraform configuration.

## Usage

### Running Terraform

#### Set up remote state (using S3 and DynamoDB):

Go to the *remote-state* directory:

```bash
cd remote-state
terraform init
terraform apply
```
Keep in mind that those commands create local *remote-state/terraform.tfstate* file. If you need to share it with other team members (I guess you do) don't forget to commit it to the repository.

#### Set up Lambda resources

Go to the previous directory:

```bash
cd ..
terraform init
terraform apply
```

This time your state file for all the resources is kept in S3 bucket, which was created in the previous step, up above.

#### Destroying remote-state resources (if you are absolutely certain what you are doing):

Since S3 bucket and DynamoDB table are set up to prevent from being destroyed, you need to run a couple of steps first:

1. Go to the *remote-state* directory
2. Change all `prevent_destroy` occurrences from `true` to `false`
3. Change `force_destroy` from `false` to `true`

Then:

```bash
terraform apply
terraform destroy
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
