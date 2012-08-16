require 'right_aws'
require 'json'

# Creates a CloudFront Distribution (origin can be S3 bucket or Custom)
# Parameters:
#   - ORIGIN_HOST (required) - the S3 object public DNS name or a custom URI
#   - DEFAULT_ROOT_OBJECT (optional) - e.g. index.html

ORIGIN_HOST=ARGV.shift
raise "Missing Origin Host" if ORIGIN_HOST.nil?

DEFAULT_ROOT_OBJECT=ARGV.shift

acf = RightAws::AcfInterface.new(ENV['AWSAccessKeyId'], ENV['AWSSecretKey'])

s3_origin = ORIGIN_HOST.match(/s3\.amazonaws\.com/)

config = { :enabled => true }
config[:default_root_object] = DEFAULT_ROOT_OBJECT unless DEFAULT_ROOT_OBJECT.nil?

if s3_origin
  config[:comment] = "CloudFront distribution for S3 Bucket [#{ORIGIN_HOST}]"
  config[:s3_origin] = { :dns_name => ORIGIN_HOST }
else
  config[:comment] = "CloudFront distribution for Custom Origin [#{ORIGIN_HOST}]"
  config[:custom_origin] = {
    :dns_name  => ORIGIN_HOST,
    :http_port => 80,
    :https_port => 443,
    :origin_protocol_policy => 'match-viewer'
  }
end

puts "Creating CloudFront distribution for #{ORIGIN_HOST} =>"
json_result = acf.create_distribution(config)
puts JSON.pretty_generate(json_result)

puts "It will take 10-15 mins to create your distribution, check in the AWS Management console."
puts "You can query for the status with the aws_id:"
puts "  cf-query-distribution #{json_result[:aws_id]}"
