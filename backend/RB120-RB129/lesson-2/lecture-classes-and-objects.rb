# 1. 
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# 2. 
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    @first_name, @last_name = full_name.split
    @last_name ||= ''
  end

  def name
    "#{first_name} #{last_name}"
  end
end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# 3.
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    @first_name, @last_name = full_name.split
    @last_name ||= ''
  end
end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

# 4. 
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name

# 5. 
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    @first_name, @last_name = full_name.split
    @last_name ||= ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" 