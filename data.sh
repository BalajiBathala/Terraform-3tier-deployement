#!/bin/bash

# Update all packages
yum update -y

# Install Apache HTTP server
yum install -y httpd.x86_64

# Start Apache HTTP server
systemctl start httpd.service

# Enable Apache to start on boot
systemctl enable httpd.service

# Create a basic index.html page with a custom message
cat <<EOL > /var/www/html/index.html
<!DOCTYPE html>
<html>
  <head>
    <title>Terraform 3-tier Deployment on AWS</title>
  </head>
  <body>
    <h1>Hello from $(hostname -f)</h1>
    <h2>This is Balaji</h2>
  </body>
</html>
EOL
