require 'aws'

# See http://uec-images.ubuntu.com/releases/10.04/release/
# for Ubuntu 10.04 LTS (Lucid Lynx) AMI IDs.

IMAGE_ID = ARGV.shift || "ami-3fe54d56"
KEYPAIR_NAME = ARGV.shift || "aws-cmdline-labs"
PRIVATE_KEY = "keypairs/#{KEYPAIR_NAME}"
SECURITY_GROUP_NAME = "aws-cmdline-labs"

AWS.config({
    :access_key_id => ENV['AWSAccessKeyId'],
    :secret_access_key => ENV['AWSSecretKey'],
  })

ec2 = AWS::EC2.new
keypair = AWS::EC2::KeyPair.new(KEYPAIR_NAME, :private_key => PRIVATE_KEY)
raise "KeyPair #{KEYPAIR_NAME} does not exist, please create it." unless keypair.exists?
raise "Private key #{PRIVATE_KEY} does not exist, please create a keypair first." unless File.exists?(PRIVATE_KEY)

security_group = ec2.security_groups.filter('group-name', SECURITY_GROUP_NAME).first

unless security_group
  puts "Creating security group: #{SECURITY_GROUP_NAME}"
  security_group = ec2.security_groups.create('aws-cmdline-labs')
  security_group.authorize_ingress(:tcp, 80)
  security_group.authorize_ingress(:tcp, 8080)
  security_group.authorize_ingress(:tcp, 22)
end

instance = ec2.instances.create({
  :image_id => IMAGE_ID,
  :key_pair => keypair,
  :instance_type => 'm1.small',
  :security_groups => [security_group.name]
  })

instance.tags.created_by = "aws-cmdline-labs"

puts "Created instance: ID = #{instance.id}, Instance Type = #{instance.instance_type}, DNS Name = #{instance.dns_name}, IP Address = #{instance.ip_address}"

while instance.status == :pending
  puts "Waiting for instance #{instance.id} to boot..."
  sleep 2
end

puts "Done: Instance #{instance.id} status = #{instance.status}"
