# 1. Banner Class
class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message

  def horizontal_rule
    "+-#{'-'*message.length}-+"
  end

  def empty_line
    "| #{' '*message.length} |"
  end

  def message_line
    "| #{message} |"
  end
end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
class Banner
  def initialize(message, width=60)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :width

  def horizontal_rule
    "+-#{'-'*width}-+"
  end

  def empty_line
    "| #{' '*width} |"
  end

  def message_line
    "| " + message.center(width) +  " |"
  end
end

# banner = Banner.new('To boldly go where no one has gone before.', 80)
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+


# 2. 
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

name = 42
fluffy = Pet.new(name)
name += 1 # name is reassigned name = 42 + 1

# String#to_s converts 42 to String '42', therefore
# upcase is called on the String '42' on the expression @name.upcase
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name


# 3. Fix the Program - Books (Part 1)
# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

=begin Further Exploration
We use attr_reader instead of attr_writer or attr_accessor is because
we only wnat to retrieve the title and author, we don't want to reassign it. 
Therefore, we only need a getter and not a setting method, attr_reader gives us
a getter method to retrieve @author and @title instance variables.
=end


# 4. Fix the Program - Books (Part 2)
class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)