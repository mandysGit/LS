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

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


banner = Banner.new('')
puts banner
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

banner = Banner.new('To boldly go where no one has gone before.', 80)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+