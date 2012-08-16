require 'aws/s3'

# Further info on Hosting Websites on Amazon S3:
#   http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html

AWS::S3::Base.establish_connection!(
    :access_key_id     => ENV['AWSAccessKeyId'],
    :secret_access_key => ENV['AWSSecretKey']
  )

puts AWS::S3::Service.buckets.inspect
