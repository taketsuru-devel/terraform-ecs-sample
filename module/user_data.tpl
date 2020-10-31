#!/bin/bash

# Update all packages

#sudo yum update -y
#sudo yum install -y ecs-init
#sudo service docker start
#sudo start ecs

#Adding cluster name in ecs config
echo ECS_CLUSTER=${cluster_name} >> /etc/ecs/ecs.config
# cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"

# Install the SSM agent RPM
# sudo yum install -y https://s3.ap-northeast-1.amazonaws.com/amazon-ssm-region/latest/linux_amd64/amazon-ssm-agent.rpm
