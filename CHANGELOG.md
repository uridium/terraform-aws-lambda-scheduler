# CHANGELOG

<a name="v1.4.1"></a>
## [v1.4.1](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.4.0...v1.4.1) (2023-05-02)
* Simplify git-chglog structure
* Update pre-commit
* Remove unnecessary file

<a name="v1.4.0"></a>
## [v1.4.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.3.5...v1.4.0) (2023-05-01)
* Remove lambda_layer_filename output
* Add container support

<a name="v1.3.5"></a>
## [v1.3.5](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.3.4...v1.3.5) (2023-04-21)
* Rename examples
* Enable a workflow to be triggered manually
* Fix 'go get is no longer supported' error

<a name="v1.3.4"></a>
## [v1.3.4](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.3.3...v1.3.4) (2023-04-14)
* Create a sample VPC for complete-python lambda function
* Create a sample VPC for complete-nodejs lambda function

<a name="v1.3.3"></a>
## [v1.3.3](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.3.2...v1.3.3) (2022-06-20)
* Do not keep local statefile

<a name="v1.3.2"></a>
## [v1.3.2](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.3.1...v1.3.2) (2022-06-19)
* Create CloudWatch group
* Remove deprecated s3 parameters

<a name="v1.3.1"></a>
## [v1.3.1](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.3.0...v1.3.1) (2022-06-19)
* Create CloudWatch group
* Remove deprecated s3 parameters

<a name="v1.3.0"></a>
## [v1.3.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.2.2...v1.3.0) (2022-06-15)
* Do not generate providers and modules
* Update examples
* Remove region variable
* Do not define compatible_architectures
* Require terraform 1.2
* Update pre-commit

<a name="v1.2.2"></a>
## [v1.2.2](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.2.1...v1.2.2) (2021-11-04)
* Add compatible_architectures
* Add tags to IAM role
* Update aws provider version
* Update examples

<a name="v1.2.1"></a>
## [v1.2.1](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.2.0...v1.2.1) (2021-07-27)
* Remove deprecated GitHub Actions commands

<a name="v1.2.0"></a>
## [v1.2.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.1.0...v1.2.0) (2021-07-27)
* Use terraform >= 1.0
* Update pre-commit-terraform version

<a name="v1.1.0"></a>
## [v1.1.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.0.1...v1.1.0) (2020-09-09)
* Update required versions
* Add aws_s3_bucket encryption
* Update pre-commit-terraform version
* Prevent aws_dynamodb_table from being destroyed
* Upgrade pre-commit config

<a name="v1.0.1"></a>
## [v1.0.1](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v1.0.0...v1.0.1) (2020-09-02)
* Upgrade pre-commit config

<a name="v1.0.0"></a>
## [v1.0.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v0.5.0...v1.0.0) (2020-09-02)
* Add remote-state S3 destroying details
* Upgrade required versions
* Add basic-remote-state example

<a name="v0.5.0"></a>
## [v0.5.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v0.4.0...v0.5.0) (2020-07-16)
* Update required_providers
* Add badges
* Add complete-nodejs example
* Use requirements.txt as a gitkeep [ckip ci]

<a name="v0.4.0"></a>
## [v0.4.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v0.3.0...v0.4.0) (2020-07-09)
* Pass constant data to the function in json form
* Add complete example
* Do not commit zip files
* Add basic example

<a name="v0.3.0"></a>
## [v0.3.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v0.2.0...v0.3.0) (2020-07-01)
* Add X-Ray integration
* Rename aws_iam_role_policy_attachment from 'this' to 'lambda'
* Remove aws_iam_role_policy_attachment dependency from aws_lambda_function

<a name="v0.2.0"></a>
## [v0.2.0](https://github.com/uridium/terraform-aws-lambda-scheduler/compare/v0.1.0...v0.2.0) (2020-07-01)
* Add conditional vpc/basic iam policy attachment
* Add IAM role description
* Upgrade required versions
* Add github actions
* Fix .chglog permissions

<a name="v0.1.0"></a>
## v0.1.0 (2020-06-30)
* Customize CHANGELOG template
* Generate the git-chglog configuration
* Add LICENSE
* Add .gitignore
* Update required_providers
* Align equal signs
* Unify names across resources
* Generate filename and source_code_hash based on archive_file outputs
* Attach a layer to the function only if enabled
* Generate markdown table
* Add pre-commit-config file
* Initial commit
