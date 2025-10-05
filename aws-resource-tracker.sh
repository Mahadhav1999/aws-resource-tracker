#!/bin/bash

########################################################################################################
# Author: Mahadev Dhobale
# Version: 1.0
# Date: 20-09-2025
# Description: Track changes in AWS resources.
# Usage: ./aws_resource_tracker.sh
# Example: ./aws_resource_tracker.sh


# This script tracks changes in AWS resources.
# It lists EC2 instances, S3 buckets, Lambda functions, and IAM users.
# It can be scheduled to run periodically using cron jobs.
########################################################################################################

# AWS EC2
# AWS S3
# AWS Lambda
# AWS IAM Users

set -x # Debug mode

# List EC2 instances
echo "Listing EC2 instances..."
aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text > ec2_instances.txt

# List S3 buckets
echo "Listing S3 buckets..."
aws s3 ls --query 'Buckets[*].Name' --output text > s3_buckets.txt


# List Lambda functions
echo "Listing Lambda functions..."
aws lambda list-functions --query 'Functions[*].FunctionName' --output text > lambda_functions.txt

# List IAM users
echo "Listing IAM users..."
aws iam list-users --query 'Users[*].UserName' --output text > iam_users.txt

# Cron job for periodic tracking
# Daily at 9PM
0 21 * * * /path/to/aws_resource_tracker.sh >> /path/to/aws_resource_tracker.log 2>&1











