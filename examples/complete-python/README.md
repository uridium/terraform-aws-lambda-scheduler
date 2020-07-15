# Complete Lambda configuration

This examples sets up a full-fledged Lambda function and CloudWatch scheduler. It also includes:

* Lambda layer
* VPC (subnets and security groups)
* X-Ray
* tags and variables

## Usage

### Creating Lambda layer

```bash
cd lambda/layer/python
pip install -r requirements.txt -t .
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
│   └── [-rwxr-xr-x]  lambda.py
├── [drwxrwxr-x]  layer
│   └── [drwxrwxr-x]  python
│       ├── [drwxrwxr-x]  bin
│       ├── [drwxrwxr-x]  certifi
│       ├── [drwxrwxr-x]  certifi-2020.6.20.dist-info
│       ├── [drwxrwxr-x]  chardet
│       ├── [drwxrwxr-x]  chardet-3.0.4.dist-info
│       ├── [drwxrwxr-x]  idna
│       ├── [drwxrwxr-x]  idna-2.10.dist-info
│       ├── [drwxrwxr-x]  requests
│       ├── [drwxrwxr-x]  requests-2.24.0.dist-info
│       ├── [drwxrwxr-x]  urllib3
│       └── [drwxrwxr-x]  urllib3-1.25.9.dist-info
└── [-rw-rw-r--]  requirements.txt
```

where file name (*lambda.py*) is `handler` prefix, and function name (*def handler()*) is `handler` suffix:

```hcl
handler = "lambda.handler"
```

Layer content needs to be placed in `layer/python` directory
