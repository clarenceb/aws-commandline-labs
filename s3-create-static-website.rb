require 'aws'

# Creates a S3 bucket and uploads some html pages to it for a static web site.
#   - Adds a bucket policy for public read
#   - Currently making the S3 bucket into a website is a manual process (see output form command for steps)
#
# Further info on Hosting Websites on Amazon S3:
#   http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html

BUCKET_NAME=ARGV.shift
raise "Missing Bucket Name" if BUCKET_NAME.nil?

AWS.config({
    :access_key_id => ENV['AWSAccessKeyId'],
    :secret_access_key => ENV['AWSSecretKey'],
  })

s3 = AWS::S3.new

if s3.buckets[BUCKET_NAME].exists?
  raise "Bucket #{BUCKET_NAME} already exists, choose a new bucketname"
end

bucket = s3.buckets.create(BUCKET_NAME)

policy = AWS::S3::Policy.new(:statements => [
    { :effect => :allow,
      :actions => [:get_object],
      :principals => :any,
      :resources => "#{BUCKET_NAME}/*"
    }
  ])

bucket.policy = policy

Dir['public/**/*'].each do |file|
  unless File.directory? file
    file_name = file.gsub(/^public\//,'')
    bucket.objects.create(file_name, File.read(file))
    puts "--> Uploading file '#{file_name}' to bucket '#{BUCKET_NAME}'"
  end
end

puts "-------------------------"
puts "--- MANUAL NEXT STEPS ---"
puts "-------------------------"
puts "Note: The Ruby AWS SDK does not currently support enabling S3 static websites (though the REST API does)"
puts "Therefore, follow these steps:"
puts "1. Go to the AWS Management Console for S3: https://console.aws.amazon.com/s3/home"
puts "2. Select the bucket [#{BUCKET_NAME}] and select 'Properties' from the Buckets / Actions drop down menu"
puts "3. Click the 'Website' tab in the Bucket Properties"
puts "4. Check 'Enabled'"
puts "5. Enter the index document name [index.html]"
puts "6. Click 'Save'"
puts "7. Access your site via the 'Endpoint' URL (it should be http://#{BUCKET_NAME}.s3-website-us-east-1.amazonaws.com/)"
