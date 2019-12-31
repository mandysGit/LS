require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WIN_SCORE = 5
current_player = 'choose'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def joinor(arr, delimiter=', ', last_delimiter='or')
  return arr[0].to_s if arr.length == 1
  return "#{arr[0]} #{last_delimiter} #{arr[1]}" if arr.length == 2

  arr.reduce('') do |sentence, item|
    if arr.last == item
      sentence + "#{last_delimiter} #{item}"
    else
      sentence + "#{item}#{delimiter}"
    end
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = EMPTY_MARKER }
  new_board
end

def select_squares(brd, marker)
  brd.keys.select { |num| brd[num] == marker }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(select_squares(brd, EMPTY_MARKER))}):"
    square = gets.chomp.to_i
    break if select_squares(brd, EMPTY_MARKER).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square =
    find_at_risk_square(brd) ||
    select_squares(brd, EMPTY_MARKER).find { |num| num == 5 } ||
    select_squares(brd, EMPTY_MARKER).sample

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  computer_places_piece!(brd) if player == 'computer'
  player_places_piece!(brd) if player == 'player'
end

def possible_wins(brd, marker)
  # returns a 2D array of winning combinations
  WINNING_LINES.select do |win_combo|
    values_marked = 0
    select_squares(brd, marker).each do |square|
      values_marked += 1 if win_combo.include?(square)
    end

    values_marked == 2
  end
end

def find_at_risk_square(brd)
  squares_at_risk = select_squares(brd, EMPTY_MARKER).select do |square|
    possible_wins(brd, PLAYER_MARKER).any? do |win_combo|
      win_combo.include?(square)
    end
  end

  squares_to_win = select_squares(brd, EMPTY_MARKER).select do |square|
    possible_wins(brd, COMPUTER_MARKER).any? do |win_combo|
      win_combo.include?(square)
    end
  end

  return squares_to_win.first unless squares_to_win.empty?
  squares_at_risk.first
end

def board_full?(brd)
  select_squares(brd, EMPTY_MARKER).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      return 'player'
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return 'computer'
    end
  end
  nil
end

def welcome
  "Welcome to Tic Tac Toe.
  The rules to win a round is to mark 3 squares in a row with the same marker.
  You must win #{WIN_SCORE} rounds to win the entire game.
  "
end

def display_score(score)
  prompt "
  ~~~~~Scoreboard~~~~~
  Player has won #{score['player']} rounds.
  Computer has won #{score['computer']} rounds.
  There were #{score['tie']} ties.
  "
end

def update_score_board(score_board, board)
  if someone_won?(board)
    score_board[detect_winner(board)] += 1
  else
    score_board['tie'] += 1
  end
end

def match_ended?(score_board)
  score_board['player'] == WIN_SCORE || score_board['computer'] == WIN_SCORE
end

def display_match_winner(score_board)
  if score_board['player'] == WIN_SCORE
    "Congrats! You won #{WIN_SCORE} matches, You are the winner!"
  elsif score_board['computer'] == WIN_SCORE
    "Congrats! Computer won #{WIN_SCORE} matches, Computer is the winner!"
  end
end

def alternate_player(player)
  player == 'computer' ? 'player' : 'computer'
end

def choose_current_player
  choice = ''
  loop do
    puts 'Choose the starting player, enter "computer" or "player": '
    choice = gets.chomp
    break if choice == 'player' || choice == 'computer'
    puts "#{choice} is an invalid choice."
  end

  choice
end

prompt welcome
sleep(3)

loop do
  score_board = {
    'player' => 0,
    'computer' => 0,
    'tie' => 0
  }

  loop do
    board = initialize_board

    loop do
      display_board(board)
      display_score(score_board)

      current_player = choose_current_player if current_player == 'choose'
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)

      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end
    sleep(1)

    update_score_board(score_board, board)

    if match_ended?(score_board)
      prompt(display_match_winner(score_board))
      display_score(score_board)
      break
    end
  end

  prompt "Do you want to play again?
  Enter Y/y to play again. Enter anything else to exit."
  answer = gets.chomp
  break unless answer.downcase == ('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
