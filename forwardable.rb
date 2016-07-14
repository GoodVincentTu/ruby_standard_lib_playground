require "forwardable"

class Person
	extend Forwardable

	def_delegator :@address, :to_s, :full_address # Person.full_address -> @address.to_s
	def_delegators :@address, :city, :country

	attr_reader :name, :address
  def initialize name:, address: Address.new
  	@name = name
  	@address = address
  end
end

class Address
	attr_reader :street, :zipcode, :city, :country
  def initialize street:, zipcode:, city:, country:
  	@street = street
  	@zipcode = zipcode
  	@city = city
  	@country = country
  end

  def to_s
  	<<EOF
#{street}
#{zipcode} #{city}
#{country}
EOF
  end
end

# output the country value from person object
# puts Person.new(name: "Hello World", address: Address.new(street: "Main street", zipcode: 32324,
# city: "San Francisco", country: "USA")).address.country

# using forward to access another class value
puts Person.new(name: "Hello World", address: Address.new(street: "Main street", zipcode: 32324,
	city: "San Francisco", country: "USA")).full_address

person = Person.new(name: "Hello World", address: Address.new(street: "Main street", zipcode: 32324,
	city: "San Francisco", country: "USA"))
puts person.city
puts person.country
# puts person.street -> won't work, not define in the delegators method