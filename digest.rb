# running the following code in pry or irb to test the result

require 'digest'

Digest::SHA1.digest         "my-password"
Digest::SHA1.hexdigest      "my-password"
Digest::SHA1.base64digest   "my-password"

Digest::MD5.digest          "my-password"
Digest::MD5.hexdigest       "my-password"
Digest::MD5.base64digest    "my-password"

Digest::SHA256.digest       "my-password"
Digest::SHA256.hexdigest    "my-password"
Digest::SHA256.base64digest "my-password"

salt = Time.now.to_s
Digest::SHA1.hexdigest("password" + salt )
Digest::SHA1.hexdigest("password" + Time.now.to_s ) # the hash value vary with time