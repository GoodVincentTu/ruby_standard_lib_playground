require 'delegate'

class Person
  attr_reader :name
  def initialize name
  	@name = name
  end

  # def slug
  	# name.gsub /\W/, "_"
    # name.downcase.gsub /\W/, "-"
  # end
end

class PersonDecorator < SimpleDelegator
	def slug
		name.downcase.gsub /\W/, "-"
	end
end

# puts Person.new("Hello World").slug
person = Person.new("Hello World")
decorator = PersonDecorator.new(person)
puts decorator.slug