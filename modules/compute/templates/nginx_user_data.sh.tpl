#!/bin/bash
set -euxo pipefail

# Amazon Linux 2023 - install and start NGINX with its default welcome page
dnf install -y nginx
systemctl enable nginx
systemctl start nginx

# Tag the default page so it's obvious which instance answered, useful when
# demonstrating that traffic is spread across N+1 instances behind the ALB.
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")" http://169.254.169.254/latest/meta-data/instance-id)
echo "<!-- served by $INSTANCE_ID -->" >> /usr/share/nginx/html/index.html
