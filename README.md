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


Commands execution order -

1. git clone
2. terraform fmt # to rightly format the code in case required
3. terraform init #to initialise and To make the initial dependency selections that will initialize the dependency lock file
4. terraform plan # to check the plan o/p and see if the required resources are being created.
5. terraform apply --auto-approve # to create the final resources
   a. this will ask for two i/p - region and the endpoint email
6. terraform destroy --auto-approv # to destroy the resources

TEST Plan -

1. Go to AWS SQS console and click on "send and Receive Message button" and send 9-10 sample message saying "Hi" and wait for sometime.
2. This should trigger emails and alerts

Files Configuration - 
1. Main.tf
   a. this is the main file which contains provider config (we can create separate file provider.tf as well for this)
   b. this also conatins resource block to create SQS, SNS and SNS endpoint

2. alarms.tf
   a. this conatins are resource blocks to create to alarms on the basis of two different metrices

3. variables.tf
   a. this file conatins all the varibales required to create the above resources
   b. for some variables the i/p is required from user, for some default values have been configured

4. terraform.tfvars
   a. conatins the value for the varibales defined and in case to overwrite the default thresolds in case required.

References 

1. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue
2. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
3. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm
