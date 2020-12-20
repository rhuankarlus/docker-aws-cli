#!/bin/bash
set -e
cat /root/.aws/credentials
sed -i -e "s/\${aws_access_key_id}/${AWS_ACCESS_KEY_ID}/" -e "s/\${aws_secret_access_key}/${AWS_SECRET_ACCESS_KEY}/" /root/.aws/credentials
cat /root/.aws/credentials
