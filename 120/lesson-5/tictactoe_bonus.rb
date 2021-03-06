module Formatable
  def prompt(msg)
    puts "=>  #{msg}"
  end

  def padded_display(msg)
    puts "\n    #{msg}\n\n"
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
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]} "
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize

  def find_at_risk_square(line, marker)
    squares = @squares.values_at(*line)

    return nil unless squares.collect(&:marker).count(marker) == 2

    @squares.select do |key, square|
      line.include?(key) && square.marker == Square::INITIAL_MARKER
    end.keys.first
  end

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
  attr_accessor :score, :marker, :name

  def initialize(board)
    set_name
    @score = 0
    @board = board
  end

  private

  attr_reader :board
end

class Human < Player
  include Formatable

  def set_marker
    marker = ''
    loop do
      prompt("Choose a marker, enter 'x' or 'o': ")
      marker = gets.chomp
      break if [Game::X_MARKER, Game::O_MARKER].include? marker.upcase
      padded_display("Sorry, invalid choice.")
    end
    self.marker = marker.upcase
  end

  def moves
    prompt("Chose a square (#{joinor(board.unmarked_keys)}) ")

    square = ''
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      padded_display("Sorry, that's not a valid choice.")
    end

    board[square] = marker
  end

  private

  def set_name
    n = ''
    loop do
      prompt("What's your name?")
      n = gets.chomp
      break unless n.empty?
      prompt("Sorry, must enter a value.")
    end
    self.name = n
  end
end

class Computer < Player
  def moves
    square = computer_strategy(move: 'offense') ||
             computer_strategy(move: 'defense') ||
             board.unmarked_keys.find { |key| key == 5 } ||
             board.unmarked_keys.sample

    board[square] = marker
  end

  private

  def set_name
    self.name = ['Catalina', 'Synapse'].sample
  end

  def computer_strategy(move: 'offense')
    other_marker = Game::X_MARKER if marker == Game::O_MARKER
    other_marker = Game::O_MARKER if marker == Game::X_MARKER

    marker = self.marker if move == 'offense'
    marker = other_marker if move == 'defense'

    square = nil
    Board::WINNING_LINES.each do |line|
      square = board.find_at_risk_square(line, marker)
      break if square
    end

    square
  end
end

class Game
  include Formatable

  X_MARKER = "X"
  O_MARKER = "O"
  WIN_SCORE = 2

  def initialize
    @board = Board.new
    @human = Human.new(@board)
    @computer = Computer.new(@board)
    @first_to_move = 'choose'
    @current_marker = @first_to_move
  end

  def play
    clear_screen
    display_welcome_message
    players_choose_marker
    clear_screen

    choose_first_to_move! if first_to_move == 'choose'
    clear_screen

    loop do
      clear_score
      start_game
      break unless play_again?
      clear_screen
    end

    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer
  attr_accessor :first_to_move, :current_marker

  def start_game
    loop do
      start_match
      break if game_ended?
      clear_screen
    end

    display_grand_winner
  end

  def start_match
    loop do
      display_board
      display_rules
      display_score
      current_player_moves
      alternate!(current_marker)

      if match_ended?
        display_match_result
        sleep(2)
        reset
        break
      end

      clear_screen
    end
  end

  def game_ended?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def match_ended?
    board.someone_won? || board.full?
  end

  def players_choose_marker
    human.set_marker
    computer.marker = O_MARKER if human.marker == X_MARKER
    computer.marker = X_MARKER if human.marker == O_MARKER
  end

  def choose_first_to_move!
    choice = ''
    loop do
      prompt("Choose the first player, enter 'c' for computer or
      'h' for human:")
      choice = gets.chomp
      break if choice == 'h' || choice == 'c'
      padded_display("#{choice} is an invalid choice.")
    end

    self.first_to_move = X_MARKER if choice == 'h'
    self.first_to_move = O_MARKER if choice == 'c'
    self.current_marker = first_to_move
  end

  def clear_score
    human.score = 0
    computer.score = 0
  end

  def match_winner
    return human if board.winning_marker == human.marker
    return computer if board.winning_marker == computer.marker
  end

  def grand_winner
    return human if human.score == WIN_SCORE
    return computer if computer.score == WIN_SCORE
  end

  def add_point(player)
    player.score = player.score + 1
  end

  def alternate!(marker)
    self.current_marker = X_MARKER if marker == O_MARKER
    self.current_marker = O_MARKER if marker == X_MARKER
  end

  def current_player_moves
    if human_turn?
      human.moves
    else
      computer.moves
    end
  end

  def human_turn?
    @current_marker == X_MARKER
  end

  def play_again?
    answer = nil
    loop do
      prompt("Would you like to play again? (y/n)")
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      padded_display("Sorry, must be y or n")
    end

    answer == 'y'
  end

  def reset
    board.reset
    self.current_marker = first_to_move
  end

  def clear_screen
    system 'clear'
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_match_winner
    if match_winner.equal?(human)
      add_point(match_winner)
      padded_display("#{human.name} won! \u{1F389}")
    elsif match_winner.equal?(computer)
      add_point(match_winner)
      padded_display("#{computer.name} won! \u{1F389}")
    else
      padded_display("It's a tie!")
    end
  end

  def display_rules
    padded_display("RULES: Win a match by marking 3 squares in a row with the
    same marker. You must win #{WIN_SCORE} matches to win the entire game.")
  end

  def display_score
    padded_display("~~~~~Scoreboard~~~~~
    #{human.name} has won #{human.score} matches.
    #{computer.name} has won #{computer.score} matches.")
  end

  def display_welcome_message
    padded_display("Hi #{human.name}! Welcome to Tic Tac Toe!")
  end

  def display_goodbye_message
    padded_display("\u{1F600} Thank You for playing Tic Tac Toe!
    Good bye!")
  end

  def display_board
    padded_display("You're a #{human.marker}.
    #{computer.name} is a #{computer.marker}.")
    board.draw
  end

  def display_match_result
    clear_screen_and_display_board
    display_match_winner
    display_score
  end

  def display_grand_winner
    if human.score == WIN_SCORE
      padded_display("#{human.name} is the grand winner
      of #{WIN_SCORE} matches!")
    elsif computer.score == WIN_SCORE
      padded_display("#{computer.name} is the grand winner
      of #{WIN_SCORE} matches!")
    end
  end
end

game = Game.new
game.play
