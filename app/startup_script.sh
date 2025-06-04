#!/bin/bash

# Update system
yum update -y

# Install Python 3, pip, git
yum install -y python3 git

# Install Flask
pip3 install flask

# Create app directory and write Flask app
mkdir -p /var/www/app
cd /var/www/app

cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello World! Partha'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
EOF

# Run Flask app in background
python3 app.py &

# --- Begin CloudWatch Agent Setup ---

# Install CloudWatch Agent
yum install -y amazon-cloudwatch-agent

# Create CloudWatch Agent config file
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
#!/bin/bash

# Update system
yum update -y

# Install Python 3, pip, git
yum install -y python3 git

# Install Flask
pip3 install flask

# Create app directory and write Flask app
mkdir -p /var/www/app
cd /var/www/app

cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello from Python!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
EOF

# Run Flask app in background
python3 app.py &

# --- Begin CloudWatch Agent Setup ---

# Install CloudWatch Agent
yum install -y amazon-cloudwatch-agent

# Create CloudWatch Agent config file
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
