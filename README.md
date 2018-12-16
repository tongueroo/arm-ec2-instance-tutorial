# ARM EC2 Instance Tutorial

This CloudFormation stack launches an ARM based EC2 instance for testing.

1. It builds a Docker image
2. Runs the Docker container
3. Tests it by curling it

The app in the Docker image is a small sinatra app for testing, source code for it is here: [tongueroo/sinatra](https://github.com/tongueroo/sinatra)

* Blog Post: ...

## Usage

It is an [lono project](http://lono.cloud).  Adjust [config/params/base/ec2.txt](config/params/base/ec2.txt) with a KeyName that is available on your AWS account before running the commands below. The commands launches a CloudFormation stack which creates an EC2 instance opening up security group port 22 and 4657 for testing.

    git clone https://github.com/tongueroo/arm-ec2-instance-tutorial
    cd arm-ec2-instance-tutorial
    bundle
    lono cfn create ec2


If you prefer now to have to install lono and you can use the aws cli to launch the stack also:

    aws cloudformation