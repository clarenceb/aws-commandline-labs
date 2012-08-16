require 'aws'

KEYPAIR_NAME = ARGV.shift
raise "Missing KeyPair Name" if KEYPAIR_NAME.nil?

AWS.config({
    :access_key_id => ENV['AWSAccessKeyId'],
    :secret_access_key => ENV['AWSSecretKey'],
  })

ec2 = AWS::EC2.new

key_pair = ec2.key_pairs.create(KEYPAIR_NAME)
private_key_path = "keypairs/#{KEYPAIR_NAME}"

File.open(private_key_path, "w") do |f|
  f.write(key_pair.private_key)
end

puts "Wrote keypair private key to: #{private_key_path}"
