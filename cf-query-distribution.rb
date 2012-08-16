require 'right_aws'
require 'json'

AWS_ID=ARGV.shift
raise "Missing AWS_ID" if AWS_ID.nil?

acf = RightAws::AcfInterface.new(ENV['AWSAccessKeyId'], ENV['AWSSecretKey'])
json_result = acf.get_distribution(AWS_ID)
puts JSON.pretty_generate(json_result)
