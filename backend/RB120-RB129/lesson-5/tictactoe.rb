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
  INITIAL_MARKER = " "

  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER)}
  end

  def get_square_at(key)
    @squares[key]
  end
end

class Square
  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
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
  attr_reader :board

  def initialize
    @board = Board.new
  end

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
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}  |  #{board.get_square_at(1)} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(1)}  |  #{board.get_square_at(1)} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "   #{board.get_square_at(1)} |  #{board.get_square_at(1)}  |  #{board.get_square_at(1)} "
    puts "     |     |"
    puts ""
  end
end

game = TTTGame.new
game.play