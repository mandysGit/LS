module Promptable
  def prompt(msg)
    puts "=> #{msg}"
  end

  def display(msg)
    puts "
    #{msg}"
  end
end

class Board
  def initialize
  end
end

class Square
  def initialize
  end
end

class Player
  def initialize
  end

  def mark
  end
end

class TTTGame
  include Promptable

  def play
    display_welcome_message

    loop do
      display_board
      break
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end

    # display_result
    display_goodbye_message
  end

  private


  def display_welcome_message
    display("Welcome to Tic Tac Toe.
    The rules to win a round is to mark 3 squares
    in a row with the same marker.")
  end

  def display_goodbye_message
    display("\u{1F600} Thank You for playing Rock, Paper, Scissors! Good bye!")
  end

  def display_board
    puts ""
    puts "     |     |"
    puts "     |     |   "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "     |     |   "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "     |     |   "
    puts "     |     |"
    puts ""
  end
end

game = TTTGame.new
game.play