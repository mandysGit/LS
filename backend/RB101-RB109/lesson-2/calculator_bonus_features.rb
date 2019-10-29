require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, variable=nil)
  message = messages(key, LANGUAGE)
  if variable
    message_with_variable = message % { :variable => variable }
    Kernel.puts("=> #{message_with_variable}")
  else
    Kernel.puts("=> #{message}")
  end
end

def valid_number?(num)
  integer?(num) || float?(num)
end

# ^ means start of the string
# \d test against all digits
# + means one or more of the preceding matcher
# $ means end of string
def integer?(input)
  input.match?(/^\d+$/)
end

# * means zero or more
# ? means zero or one
# \. by espacing the dot, we are lookig for the actual period character
# otherwise, . would match any single character in regex
# zero or more digits followed by an optional period, followed by zero or more digits
def float?(input)
  input.match?(/^\d*\.?\d*$/)
end

def operation_to_message(op, lang=en)
  word = case op
  when '1'
    MESSAGES[lang]['adding']
  when '2'
    MESSAGES[lang]['subtracting']
  when '3'
    MESSAGES[lang]['multiplying']
  when '4'
    MESSAGES[lang]['dividing']
  end

  word
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('welcome_name', name)

loop do # main loop
  # loop do creates a new block
  number1 = ''
  loop do
    prompt('number_1')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  number2 = ''
  loop do
    prompt('number_2')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt('valid_number')
    end
  end

  prompt('operation_question')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end

  prompt('operation_statement', operation_to_message(operator, LANGUAGE))

  result =
    case operator
    when '1'
      number1.to_i() + number2.to_i()
    when '2'
      number1.to_i() - number2.to_i()
    when '3'
      number1.to_i() * number2.to_i()
    when '4'
      number1.to_f() / number2.to_f()
    end

  prompt('result', result)

  prompt('restart')
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt('thank_you')
