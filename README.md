# ARM EC2 Instance Tutorial

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

This CloudFormation stack launches an ARM-based EC2 A1 Instance Type for testing.

1. It builds a Docker image
2. Runs the Docker container
3. Tests it by curling it

The app in the Docker image is a small sinatra app for testing, source code for it is here: [tongueroo/sinatra](https://github.com/tongueroo/sinatra)

* Blog Post: [EC2 A1 Instance with AWS Homegrown ARM Processor: Easy Way to Save 40%](https://blog.boltops.com/2018/12/16/ec2-a1-instance-with-aws-homegrown-arm-processor-easy-way-to-save-40)

## Usage

It is an [lono project](http://lono.cloud).  Adjust [config/params/base/ec2.txt](config/params/base/ec2.txt) with a KeyName that is available on your AWS account before running the commands below. The commands launches a CloudFormation stack which creates an EC2 instance opening up security group port 22 and 4657 for testing.

IMPORTANT: You'll need to adjust [config/params/base/ec2.txt](https://github.com/tongueroo/arm-ec2-instance-tutorial/blob/master/config/params/base/ec2.txt) with a KeyName that is available on your AWS account. Here are the commands:

Example:

    $ git clone https://github.com/tongueroo/arm-ec2-instance-tutorial
    $ cd arm-ec2-instance-tutorial # Remember to adjust config/params/ec2.txt with your KeyNmae
    $ bundle
    $ lono cfn create ec2 --template ec2
    Using template: output/templates/ec2.yml
    Using parameters: config/params/development/ec2.txt
    Creating ec2-pee stack...
    No detected app/scripts
    Generating CloudFormation templates:
      output/templates/ec2.yml
      output/params/ec2.json
    Parameters passed to cfn.create_stack:
    ---
    stack_name: ec2-pee
    parameters:
    - parameter_key: KeyName
      parameter_value: default
    disable_rollback: false
    template_body: 'Hidden due to size... View at: output/templates/ec2.yml'
    Creating ec2-pee stack.
    Waiting for stack to complete
    04:11:01AM CREATE_IN_PROGRESS AWS::CloudFormation::Stack ec2-pee User Initiated
    04:11:05AM CREATE_IN_PROGRESS AWS::EC2::SecurityGroup InstanceSecurityGroup
    04:11:10AM CREATE_IN_PROGRESS AWS::EC2::SecurityGroup InstanceSecurityGroup Resource creation Initiated
    04:11:10AM CREATE_COMPLETE AWS::EC2::SecurityGroup InstanceSecurityGroup
    04:11:13AM CREATE_IN_PROGRESS AWS::EC2::Instance EC2Instance
    04:11:14AM CREATE_IN_PROGRESS AWS::EC2::Instance EC2Instance Resource creation Initiated
    04:11:22AM CREATE_COMPLETE AWS::EC2::Instance EC2Instance
    04:11:24AM CREATE_COMPLETE AWS::CloudFormation::Stack ec2-pee
    Stack success status: CREATE_COMPLETE
    Time took for stack deployment: 25s.
    $

If you prefer not to use lono, you can use the aws cli to launch the stack also:

    aws cloudformation create-stack --stack-name=ec2-$(date +%s) --template-body file://raw/ec2.yml --parameters ParameterKey=KeyName,ParameterValue=default

Remember to substitute `default` for your KeyName value. Also note, the `date +%s` command is used to add a random suffix.
