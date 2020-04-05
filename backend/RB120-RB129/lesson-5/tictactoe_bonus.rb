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
  attr_accessor :score, :marker

  def initialize
    @score = 0
  end
end

class Human < Player
  include Formatable

  def set_marker
    marker = ''
    loop do
      prompt("Choose a marker: '#{Game::X_MARKER}' or '#{Game::O_MARKER}'")
      marker = gets.chomp
      break if [Game::X_MARKER, Game::O_MARKER].include? marker
      paded_display("Sorry, invalid choice.")
    end
    self.marker = marker
  end
end

class Computer < Player
  def set_marker(marker)
    self.marker = marker
  end
end

class Game
  include Formatable

  X_MARKER = "X"
  O_MARKER = "O"
  WIN_SCORE = 2

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @first_to_move = 'choose'
    @current_marker = @first_to_move
  end

  def play
    display_welcome_message

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

  def players_choose_marker
    human.set_marker

    if human.marker == X_MARKER
      computer.set_marker(O_MARKER)
    else
      computer.set_marker(X_MARKER)
    end
  end

  def start_game
    loop do
      players_choose_marker
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
      choose_first_to_move! if first_to_move == 'choose'
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

  def choose_first_to_move!
    choice = ''
    loop do
      prompt("Choose the first player, enter 'c' for computer or
      'h' for human:")
      choice = gets.chomp
      break if choice == 'h' || choice == 'c'
      paded_display("#{choice} is an invalid choice.")
    end

    self.first_to_move = X_MARKER if choice == 'h'
    self.first_to_move = O_MARKER if choice == 'c'
    self.current_marker = first_to_move
  end

  def game_ended?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def match_ended?
    board.someone_won? || board.full?
  end

  def display_match_result
    clear_screen_and_display_board
    display_match_winner
    display_score
  end

  def display_grand_winner
    if human.score == WIN_SCORE
      paded_display("human is the grand winner of #{WIN_SCORE} matches!")
    elsif computer.score == WIN_SCORE
      paded_display("computer is the grand winner of #{WIN_SCORE} matches!")
    end
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
    if marker == O_MARKER
      self.current_marker = X_MARKER
    else
      self.current_marker = O_MARKER
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
    else
      computer_moves
    end
  end

  def human_turn?
    @current_marker == X_MARKER
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
    square = computer_strategy(move: 'offense') ||
             computer_strategy(move: 'defense') ||
             board.unmarked_keys.find { |key| key == 5 } ||
             board.unmarked_keys.sample

    board[square] = computer.marker
  end

  def computer_strategy(move: 'offense')
    marker = O_MARKER if move == 'offense'
    marker = X_MARKER if move == 'defense'

    square = nil
    Board::WINNING_LINES.each do |line|
      square = board.find_at_risk_square(line, marker)
      break if square
    end

    square
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
      paded_display("human won! \u{1F389}")
    elsif match_winner.equal?(computer)
      add_point(match_winner)
      paded_display("computer won! \u{1F389}")
    else
      display("It's a tie!")
    end
  end

  def display_rules
    paded_display("RULES: Win a match by marking 3 squares in a row with the
    same marker. You must win #{WIN_SCORE} matches to win the entire game.")
  end

  def display_score
    paded_display("~~~~~Scoreboard~~~~~
    Player has won #{human.score} matches.
    Computer has won #{computer.score} matches.")
  end

  def display_welcome_message
    paded_display("Welcome to Tic Tac Toe!")
  end

  def display_goodbye_message
    paded_display("\u{1F600} Thank You for playing Tic Tac Toe!
    Good bye!")
  end

  def display_board
    paded_display("You're a #{human.marker}. Computer is a #{computer.marker}.")
    board.draw
  end
end

game = Game.new
game.play
