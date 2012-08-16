Some commandline examples for AWS training.

Pre-requisities:
----------------
- Ruby 1.8.7+
- Ruby Gems 1.3.7+
- Bundler gem

You can install Ruby via RVM if you like.
If you don't have Bundler gem installed then the aws.sh script will
attempt to install it for you.  If you aren't using a user managed
Ruby then you may need to run aws.sh with 'sudo' in order to install
Bundler (or just make sure you install Bundler first).

Type:

  [sudo] gem install bundler

Usage:

  ./aws.sh <command_name> [<args>]

  e.g.

  ./aws.sh s3-create-static-website.rb my-bucket


Further information:
--------------------

aws-sdk ruby gem:
  http://aws.amazon.com/sdkforruby/
  http://docs.amazonwebservices.com/AWSRubySDK/latest/

right_aws ruby gem:
  http://rightscale.rubyforge.org/right_aws_gem_doc/
