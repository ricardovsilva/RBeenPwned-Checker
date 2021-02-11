require 'restclient'
require 'digest'

HAVE_I_BEEN_PWNED_API_URL = 'https://api.pwnedpasswords.com/range/'

password = ARGV[0]

unless password
  print "Password: "
  password = gets.chomp
end


hash = Digest::SHA1.hexdigest password
first_chars = hash[0..4]
last_chars = hash[5..-1].upcase

response = RestClient.get("#{HAVE_I_BEEN_PWNED_API_URL}/#{first_chars}")
passwords_hashes = response.body.split("\r\n")
password_hash = passwords_hashes.find {|p| p.start_with?(last_chars)}

unless password_hash
  puts 'Your password was not breached!'
else
  quantity = password_hash.split(':')[-1]
  puts "Your password was breached #{quantity} times."
  STDOUT.flush
end




