
#1) Privacy
class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# Further Exploration
class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def display_switch
    puts switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

#2) Fixed Array
class FixedArray
  def initialize(length)
    @length = length
    @array = [nil] * length
  end

  def []=(idx, value)
    @array.fetch(idx)
    @array[idx] = value
  end

  def [](idx)
    @array.fetch(idx)
  end

  def to_a
    @array.clone
  end

  def to_s
    @array.to_s
  end
end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end


#3) Students
class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

# alice = Undergraduate.new('Alice', '2020')
# p alice

#4) Circular Queue
class CircularQueue
  def initialize(size)
    @queue = []
    @size = size
  end

  def enqueue(value)
    if @queue.size < @size
      @queue << value
    else
      @queue.shift
      @queue << value
    end
  end

  def dequeue
    @queue.shift
  end
end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil


# 6) Number Guesser Part 1
# class GuessingGame
#   LOWER = 1
#   UPPER = 100

#   def initialize
#     @limit = 7
#     @target = Random.new.rand(1..100)
#     @guess = nil
#   end

#   def play
#     loop do
#       if no_more_guesses?
#         puts "You have no more guesses. You lost!"
#         break
#       elsif correct_guess?
#         break
#       end

#       start
#     end
#   end

#   private

#   def start
#     puts ""
#     puts "You have #{@limit} guesses remaining."

#     loop do
#       print "Enter a number between #{LOWER} and #{UPPER}: "
#       @guess = gets.chomp.to_i
#       break if (1..100).include?(@guess)

#       print "Invalid guess."
#     end

#     @limit = @limit - 1
#     validate(@guess)
#   end

#   def validate(guess)
#     if correct_guess?
#       puts "That's the number!"
#       puts "You won!"
#     elsif guess > @target
#       puts "Your guess is too high."
#     else
#       puts "Your guess is too low."
#     end
#   end

#   def no_more_guesses?
#     @limit == 0
#   end

#   def correct_guess?
#     @guess == @target
#   end
# end

# game = GuessingGame.new
# game.play



# 7) Number Guesser Part 1
class GuessingGame
  def initialize(low, high)
    @limit = Math.log2((low..high).to_a.length).to_i + 1
    @target = Random.new.rand(low..high)
    @low = low
    @high = high
    @guess = nil
  end

  def play
    loop do
      if no_more_guesses?
        puts "You have no more guesses. You lost!"
        break
      elsif correct_guess?
        break
      end

      start
    end
  end

  private

  def start
    puts ""
    puts "You have #{@limit} guesses remaining."

    loop do
      print "Enter a number between #{@low} and #{@high}: "
      @guess = gets.chomp.to_i
      break if (@low..@high).include?(@guess)

      print "Invalid guess."
    end

    @limit = @limit - 1
    validate(@guess)
  end

  def validate(guess)
    if correct_guess?
      puts "That's the number!"
      puts "You won!"
    elsif guess > @target
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
  end

  def no_more_guesses?
    @limit == 0
  end

  def correct_guess?
    @guess == @target
  end
end

game = GuessingGame.new(501, 1500)
game.play