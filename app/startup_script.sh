#!/bin/bash


yum update -y
yum install -y python3 git
pip3 install flask

# Creating Flask app
mkdir -p /var/www/app
git clone https://github.com/RivuParth/assignment-aws /var/www/app
cd /var/www/app

# ##--- Begin CloudWatch Agent Setup ---

yum install -y amazon-cloudwatch-agent

# Config file
cat <<CWCONFIG > /opt/aws/amazon-cloudwatch-agent/bin/config.json
{
  "metrics": {
    "namespace": "CWAgent",
    "metrics_collected": {
      "mem": {
        "measurement": [
          "mem_used_percent"
        ],
        "metrics_collection_interval": 60
      },
      "cpu": {
        "measurement": [
          "cpu_usage_idle",
          "cpu_usage_iowait",
          "cpu_usage_user",
          "cpu_usage_system"
        ],
        "metrics_collection_interval": 60,
        "totalcpu": true
      }
    }
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/messages",
            "log_group_name": "/ec2/my-app-logs",
            "log_stream_name": "{instance_id}/messages",
            "timestamp_format": "%b %d %H:%M:%S"
          },
          {
            "file_path": "/var/log/nginx/access.log",
            "log_group_name": "/ec2/my-app-logs",
            "log_stream_name": "{instance_id}/nginx-access",
            "timestamp_format": "%d/%b/%Y:%H:%M:%S %z"
          }
        ]
      }
    }
  }
}
CWCONFIG

# Start CloudWatch Agent
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
