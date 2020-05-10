variable "admin_password" {
  description = "The master admin password. Used to bootstrap and login to the master. Also pushed to ssm parameter store for posterity."
}

variable "agent_lt_version" {
  description = "The version of the agent launch template to use. Only use if you need to programatically select an older version of the launch template. Not recommended to change."
  default     = "$Latest"
}

variable "agent_max" {
  description = "The maximum number of agents to run in the agent ASG."
  default     = 6
}

variable "agent_min" {
  description = "The minimum number of agents to run in the agent ASG."
  default     = 2
}

variable "agent_volume_size" {
  description = "The size of the agent volume."
  default     = 16
}

variable "ami_name" {
  description = "The name of the amzn2 ami. Used for searching for AMI id."
  default     = "amzn2-ami-hvm-2.0.*-x86_64-gp2"
}

variable "ami_owner" {
  description = "The owner of the amzn2 ami."
  default     = "amazon"
}

variable "api_ssm_parameter" {
  description = "The path value of the API key, stored in ssm parameter store."
  default     = "/api_key"
}

variable "application" {
  description = "The application name, to be interpolated into many resources and tags. Unique to this project."
  default     = "jenkins"
}

variable "auto_update_plugins_cron" {
  description = "Cron to set to auto update plugins. The default is set to February 31st, disabling this functionality. Overwrite this variable to have plugins auto update."
  default     = "0 0 31 2 *"
}

variable "cidr_ingress" {
  description = "IP address cidr ranges allowed access to the LB."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "custom_plugins" {
  default     = ""
  description = "Custom plugins to install alongside the defaults. Pull from outside the module."
}

variable "domain_name" {
  description = "The root domain name used to lookup the route53 zone information."
}

variable "efs_mode" {
  default     = "bursting"
  description = "The EFS throughput mode. Options are bursting and provisioned. To set the provisioned throughput in mibps, configure efs_provisioned_throughput variable."
}

variable "efs_provisioned_throughput" {
  default     = 3
  description = "The EFS provisioned throughput in mibps. Ignored if EFS throughput mode is set to bursting."
}

variable "executors" {
  description = "The number of executors to assign to each agent. Must be an even number, divisible by two."
  default     = 4
}

variable "extra_agent_userdata" {
  default     = ""
  description = "Extra agent user-data to add to the default built-in."
}

variable "extra_agent_userdata_merge" {
  default     = "list(append)+dict(recurse_array)+str()"
  description = "Control how cloud-init merges extra agent user-data sections."
}

variable "extra_master_userdata" {
  default     = ""
  description = "Extra master user-data to add to the default built-in."
}

variable "extra_master_userdata_merge" {
  default     = "list(append)+dict(recurse_array)+str()"
  description = "Control how cloud-init merges extra master user-data sections."
}

variable "instance_type" {
  description = "The type of instances to use for both ASG's. The first value in the list will be set as the master instance."
  default     = ["t3a.xlarge", "t3.xlarge", "t2.xlarge"]
}

variable "jenkins_version" {
  description = "The version number of Jenkins to use on the master. Change this value when a new version comes out, and it will update the launch configuration and the autoscaling group."
  default     = "2.222.3"
}

variable "key_name" {
  default     = null
  description = "SSH Key to launch instances."
}

variable "master_lt_version" {
  description = "The version of the master launch template to use. Only use if you need to programatically select an older version of the launch template. Not recommended to change."
  default     = "$Latest"
}

variable "password_ssm_parameter" {
  description = "The path value of the master admin passowrd, stored in ssm parameter store."
  default     = "/admin_password"
}

variable "private_subnet_name" {
  description = "The name prefix of the private subnets to pull in as a data source."
}

variable "public_subnet_name" {
  description = "The name prefix of the public subnets to pull in as a data source."
}

variable "r53_record" {
  description = "The FQDN for the route 53 record."
}

variable "region" {
  description = "The AWS region to deploy the infrastructure too."
}

variable "scale_down_number" {
  default     = -1
  description = "Number of agents to destroy when scaling down."
}

variable "scale_up_number" {
  default     = 1
  description = "Number of agents to create when scaling up."
}

variable "ssl_certificate" {
  description = "The name of the SSL certificate to use on the load balancer."
}

variable "ssm_parameter" {
  description = "The full ssm parameter path that will house the api key and master admin password. Also used to grant IAM access to this resource."
}

variable "swarm_version" {
  description = "The version of swarm plugin to install on the agents. Update by updating this value."
  default     = "3.19"
}

variable "tags" {
  description = "tags to define locally, and interpolate into the tags in this module."
  type        = map(string)
}

variable "vpc_name" {
  description = "The name of the VPC the infrastructure will be deployed to."
}
