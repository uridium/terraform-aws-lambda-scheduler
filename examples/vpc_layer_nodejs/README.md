# Complete Lambda configuration

This examples sets up a full-fledged Lambda function and CloudWatch scheduler. It also includes:

* Lambda layer
* VPC, subnets, security group, NAT gateway
* X-Ray
* tags and variables

## Usage

### Creating Lambda layer

```bash
cd lambda/layer/nodejs
npm install
cd -
```

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

Given the attached example, your `code_directory` structure should look like this:

```bash
lambda
├── [drwxrwxr-x]  function
│   └── [-rw-rw-r--]  lambda.js
└── [drwxrwxr-x]  layer
    └── [drwxrwxr-x]  nodejs
        ├── [drwxrwxr-x]  node_modules
        │   ├── [drwxrwxr-x]  decompress-response
        │   ├── [drwxrwxr-x]  mimic-response
        │   ├── [drwxrwxr-x]  once
        │   ├── [drwxrwxr-x]  simple-concat
        │   ├── [drwxrwxr-x]  simple-get
        │   └── [drwxrwxr-x]  wrappy
        ├── [-rw-rw-r--]  package.json
        └── [-rw-rw-r--]  package-lock.json

10 directories, 3 files
```

where file name (*lambda.js*) is `handler` prefix, and function name (*exports.handler*) is `handler` suffix:

```hcl
handler = "lambda.handler"
```

Layer content needs to be placed in `layer/nodejs` directory
