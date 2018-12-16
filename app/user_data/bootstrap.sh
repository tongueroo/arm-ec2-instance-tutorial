#!/bin/bash

sudo yum install -y git

# rebuild the Docker image on instance so it's built with ARM architecture
git clone https://github.com/tongueroo/sinatra
cd sinatra
docker build -t tongueroo/sinatra:arm .

# Run the Docker container and curl it to test
set -x # turn on tracing to see commands near the end
docker run --rm -d -p 4567:4567 tongueroo/sinatra:arm
sleep 10 # wait for container to start
curl -s localhost:4567 ; echo

uptime > /tmp/uptime.txt # to see how long process takes
