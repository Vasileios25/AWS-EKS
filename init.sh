aws sso login --profile sso-base
export AWS_PROFILE=terraform
export AWS_SDK_LOAD_CONFIG=1
terraform init
terraform plan
terraform apply