require 'uri'
require 'cgi'

uri = URI("http://hello:password@dev.hello_again.com:8080/blog?id=123&preview=true#readme")

puts(
	uri.scheme,
	uri.user,
	uri.password,
	uri.host,
	uri.port,
	uri.path,
	uri.query,
	CGI::parse(uri.query),
	uri.fragment
)