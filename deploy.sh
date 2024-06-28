#!/bin/bash

# Variables
namespace="flask-app"
REGION="eu-central-1"
account_id="128008337872"
image_name="${account_id}.dkr.ecr.${REGION}.amazonaws.com/${namespace}:latest"
dockerfile_path="."  # Path to the Dockerfile

# End Variables

# create the cluster
echo "--------------------Creating ECR--------------------"
cd terraform || { echo "Terraform directory not found"; exit 1; }
terraform init 
terraform apply -auto-approve

# ECR Login
echo "--------------------Login to ECR--------------------"
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${account_id}.dkr.ecr.${REGION}.amazonaws.com

# Remove previous build (if exists)
echo "--------------------Removing Previous Docker Image--------------------"
docker rmi -f ${namespace}:latest || true  # Ignore errors if no previous image exists

# Build the Docker image
echo "--------------------Building Docker Image--------------------"
docker build -t ${namespace}:latest ${dockerfile_path}

# Push the latest build to ECR
echo "--------------------Pushing Docker Image--------------------"
docker tag ${namespace}:latest ${image_name}
docker push ${image_name}
