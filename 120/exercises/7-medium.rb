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
    elsif guess > @targe
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