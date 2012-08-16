Commandline examples for AWS commandline learning.
----------------

### Pre-requisities:
- Ruby 1.8.7+
- Ruby Gems 1.3.7+
- Bundler 1.0+

You can install Ruby via RVM if you like.
If you don't have Bundler gem installed then the aws.sh script will
attempt to install it for you.  If you aren't using a user managed
Ruby then you may need to run aws.sh with 'sudo' in order to install
Bundler (or just make sure you install Bundler first).

Type:

    [sudo] gem install bundler

- AWS account

You will need to sign up for an AWS account (with a valid credit card).
Note that its up to you to check and clean up any resources via the AWS Management Console
after running these exercises to ensure you don't have any resources left over.

Note down your Access Key and Secret Key from the Security Credetials tab after you log into the AWS Console.
Put these in a file called 'aws-credentials.txt' (see the aws-credentials-template.txt file).

Usage:

    ./aws.sh <command_name> [<args>]

e.g.

    ./aws.sh s3-create-static-website.rb my-bucket


###   Further information:

aws-sdk ruby gem:

- [http://aws.amazon.com/sdkforruby/](http://aws.amazon.com/sdkforruby/)
- [http://docs.amazonwebservices.com/AWSRubySDK/latest/frames.html](http://docs.amazonwebservices.com/AWSRubySDK/latest/frames.html)

right\_aws ruby gem:

- [http://rightscale.rubyforge.org/right\_aws\_gem\_doc/](http://rightscale.rubyforge.org/right_aws_gem_doc/)
