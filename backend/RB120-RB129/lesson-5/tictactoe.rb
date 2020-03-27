module Formatable
  def prompt(msg)
    puts "
    => #{msg}"
  end

  def paded_display(msg)
    puts "
    #{msg}
    "
  end

  def display(msg)
    puts msg.to_s
  end

  def joinor(arr, delimiter=', ', conjunction='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then "#{arr[0]} #{conjunction} #{arr[1]}"
    else
      arr[-1] = "#{conjunction} #{arr[-1]}"
      arr.join(delimiter)
    end
  end
end

class Board
  include Formatable

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    display "     |     |"
    display "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]} "
    display "     |     |"
    display "-----+-----+-----"
    display "     |     |"
    display "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]} "
    display "     |     |"
    display "-----+-----+-----"
    display "     |     |"
    display "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]} "
    display "     |     |"
    display ""
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    markers.size == 3 && markers.all?(markers.first)
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Game
  include Formatable

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_message

    loop do
      display_board
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer

  def start_match
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    prompt("Chose a square (#{joinor(board.unmarked_keys)}) ")

    square = ''
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      paded_display("Sorry, that's not a valid choice.")
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def play_again?
    answer = nil
    loop do
      prompt("Would you like to play again? (y/n)")
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      paded_display("Sorry, must be y or n")
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_play_again_message
    paded_display("Let's play again!")
  end

  def display_welcome_message
    paded_display("Welcome to Tic Tac Toe! The rules to win a round is to mark
    3 squares in a row with the same marker.")
  end

  def display_goodbye_message
    paded_display("\u{1F600} Thank You for playing Rock, Paper, Scissors!
    Good bye!")
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      paded_display("You won!")
    when computer.marker
      paded_display("Computer won!")
    else
      paded_display("It's a tie!")
    end
  end

  def display_board
    paded_display("You're a #{human.marker}. Computer is a #{computer.marker}.")
    board.draw
  end
end

game = Game.new
game.play
