The above terraform code will create the following resources and their respective alarms for few of the metrices :
1. AWS SQS - An example SQS for which alarms are configured
2. AWS SNS Topic - used to route alerts to specific email IDs.
3. AWS Cloud Watch Alarms - Two AWS cloud watch alarms for two different SQS metrices which will trigger email after certain threshold.

Pre-Requisite to execute the code - 
1. An AWS account
2. IAM user with the required policies to perform the actions #steps to create the same - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html
3. Access credentials for the above IAM user to be confiugured on cli to create the resources remotely via this IaC - # https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
4. A linux machine with terraform and aws cli installed # https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli #https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
5. aws credentials configured # use command "aws config" and then provide access key and secret key from step 3 above.


SQS the name for this SQS could be provided by the user in the terraform.tfvars file
