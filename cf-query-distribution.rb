require 'right_aws'
require 'json'

# Queries a CloudFront distribution (using the AWS ID)

AWS_ID=ARGV.shift
raise "Missing AWS_ID" if AWS_ID.nil?

acf = RightAws::AcfInterface.new(ENV['AWSAccessKeyId'], ENV['AWSSecretKey'])
json_result = acf.get_distribution(AWS_ID)
puts JSON.pretty_generate(json_result)
