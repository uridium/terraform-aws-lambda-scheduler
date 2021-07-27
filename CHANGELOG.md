# CHANGELOG


## [v1.2.1] - 2021-07-27

- Remove deprecated GitHub Actions commands


## [v1.2.0] - 2021-07-27

- Use terraform >= 1.0
- Update pre-commit-terraform version


## [v1.1.0] - 2020-09-09

- Update required versions
- Add aws_s3_bucket encryption
- Update pre-commit-terraform version
- Prevent aws_dynamodb_table from being destroyed
- Upgrade pre-commit config


## [v1.0.1] - 2020-09-02

- Upgrade pre-commit config


## [v1.0.0] - 2020-09-02

- Add remote-state S3 destroying details
- Upgrade required versions
- Add basic-remote-state example


## [v0.5.0] - 2020-07-16

- Update required_providers
- Add badges
- Add complete-nodejs example
- Use requirements.txt as a gitkeep [ckip ci]


## [v0.4.0] - 2020-07-09

- Pass constant data to the function in json form
- Update README
- Add complete example
- Update basic example README
- Do not commit zip files
- Add basic example


## [v0.3.0] - 2020-07-01

- Add X-Ray integration
- Rename aws_iam_role_policy_attachment from 'this' to 'lambda'
- Remove aws_iam_role_policy_attachment dependency from aws_lambda_function


## [v0.2.0] - 2020-07-01

- Add conditional vpc/basic iam policy attachment
- Add IAM role description
- Upgrade required versions
- Add github actions
- Fix .chglog permissions


## v0.1.0 - 2020-06-30

- Customize CHANGELOG template
- Generate the git-chglog configuration
- Add LICENSE
- Add .gitignore
- Update required_providers
- Align equal signs
- Unify names across resources
- Generate filename and source_code_hash based on archive_file outputs
- Attach a layer to the function only if enabled
- Generate markdown table
- Add README terraform-docs markers
- Add pre-commit-config file
- Initial commit

