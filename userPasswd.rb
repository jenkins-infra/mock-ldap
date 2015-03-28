#!/usr/bin/env ruby
# Ruby script to generate SSHA (Good for LDAP)
require 'digest/sha1'
require 'base64'
hash = "{SSHA}"+Base64.encode64(Digest::SHA1.digest('password'+'salt')+'salt').chomp!
puts 'userPassword: '+hash+"\n"
