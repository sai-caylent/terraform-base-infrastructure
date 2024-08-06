#!/bin/bash

set -e

if [[ -z "${WORKSPACE}" ]]; then
    echo "Variable WORKSPACE is not defined."
    exit 1
fi

if [[ -z "${TF_COMMAND}" ]]; then
    echo "Variable TF_COMMAND is not defined."
    exit 1
fi

if [[ -z "${GH_TOKEN}" ]]; then
    echo "Variable GH_TOKEN is not defined."
    exit 1
fi

git config --global url."https://oauth2:${GH_TOKEN}@github.com".insteadOf https://github.com

terraform init -input=false
terraform workspace new ${WORKSPACE} || echo "Workspace ${WORKSPACE} already exists or cannot be created."

export TF_WORKSPACE=$WORKSPACE

if [ "${TF_COMMAND}" == "plan" ]; then
    terraform plan -input=false -var-file=${WORKSPACE}.tfvars
elif [ "${TF_COMMAND}" == "apply" ]; then
    terraform apply -input=false -var-file=${WORKSPACE}.tfvars -auto-approve
    terraform output
else
    echo "The environment variable TF_COMMAND is not set or has the wrong value"
    exit 1
fi
