# 5 ) Stack Machine Interpretation

class MinilangError < StandardError; end
class StackEmptyError < MinilangError; end
class UnknownOperationError < MinilangError; end

class Minilang
  OPERATIONS = %w(PUSH POP PRINT MULT DIV MOD ADD SUB)

  def initialize(commands)
    @commands = commands.split
    @register = 0
    @stack = []
  end

  def eval
    @commands.each do |command|
      if command.match?(/^[-+]?\d+$/)
        @register = command.to_i
      elsif OPERATIONS.include?(command)
        send(command.downcase)
      else
        raise UnknownOperationError.new("#{command} is an unknown operation")
      end
    end
  end

  private

  def push
    @stack.push(@register)
  end

  def pop
    raise StackEmptyError, "Stack is Empty" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts @register
  end

  def mult
    @register = @stack.pop * @register
  end

  def div
    @register = @register / @stack.pop
  end

  def mod
    @register = @register % @stack.pop
  end

  def add
    @register = @stack.pop + @register
  end

  def sub
    @register = @register - @stack.pop
  end
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)