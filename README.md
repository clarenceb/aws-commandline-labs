Commandline examples for AWS learning.
--------------------------------------

### Overview

This repository consists of a bunch of command line scripts for working with AWS.
They make use of the official Ruby AWS SDK and the RightScale (right\_aws) gem
(used for CloudFront access, since the Ruby AWS SDK does not appear to support it yet).

The scripts are not intended to be "DRY" and not use abstraction over the AWS Ruby gems
so that you can learn how things work closer to the REST API level

There are higher level Ruby gems such as [Fog](https://github.com/fog/fog/) and
[Knife EC2](https://github.com/opscode/knife-ec2/) which are worth looking at
if you do not want to abstract the details of working with AWS resources or
even working across different clouds (in [Fog's](http://fog.io/1.5.0/index.html) case).


This is still work-in-progress and may be continued or abandoned depending on how
useful I feel this stuff becomes.  It's currently a repo for me to practices access
the AWS REST APIs via the command line.

**Notes:**  There are also some use Java based API tools provided by Amazon which are
        probably easier to work with from the command line without requiring the
        use of Ruby:

- [Amazon EC2 API Tools](http://aws.amazon.com/developertools/351/)
- [Amazon CloudWatch Command Line Tool](http://aws.amazon.com/developertools/2534)
- [Auto Scaling Command Line Tool](http://aws.amazon.com/developertools/2535)

### Pre-requisities:
- Ruby 1.8.7+
- Ruby Gems 1.3.7+
- Bundler 1.0.x+

You will need Ruby/RubyGems installed on your system.  You can either
use the system default, installed via a package or use RVM to manage
your Rubies in user space.

If you don't have Bundler gem installed then the aws.sh script will
attempt to install it for you.  However, If you aren't using a user managed
Ruby then you may need to run aws.sh with 'sudo' in order to install
Bundler (probably best to just make sure you install Bundler first).

**Enter:**

    [sudo] gem install bundler

- AWS account

You will need to sign up for an AWS account (with a valid credit card).
Note that its up to you to check and clean up any resources via the AWS Management Console
after running these exercises to ensure you don't have any resources left over.

Note down your 'Access Key ID' and 'Secret Access Key' from the Security Credetials tab after you log into the AWS Console. Put these in a file called 'aws-credentials.txt' (see the aws-credentials-template.txt file).

**Command(s) usage:**

    ./aws.sh <command_name> [<args>]

**e.g.**

    ./aws.sh s3-create-static-website.rb my-bucket

### Getting Started

Have a look at the **Exercises.txt** file as a starting point for some exercises which have a kind of sequence to them.  Otherwise, you can just execute the individual commands and modify them to understand what's possible.  Have a look at the [Ruby AWS SDK API docs](http://docs.amazonwebservices.com/AWSRubySDK/latest/frames.html) to guide your learning.

Currently, these scripts assume a Linux or MacOS X environment but I might add some Windows scripts as well in the future.

### Further information:

aws-sdk ruby gem (from [Amazon Web Services](http://aws.amazon.com/)):

- [http://aws.amazon.com/sdkforruby/](http://aws.amazon.com/sdkforruby/)
- [http://docs.amazonwebservices.com/AWSRubySDK/latest/frames.html](http://docs.amazonwebservices.com/AWSRubySDK/latest/frames.html)

right\_aws ruby gem (from [RightScale](http://www.rightscale.com/)):

- [http://rightscale.rubyforge.org/right\_aws\_gem\_doc/](http://rightscale.rubyforge.org/right_aws_gem_doc/)
