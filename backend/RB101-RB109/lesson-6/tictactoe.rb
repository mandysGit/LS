require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WIN_SCORE = 5

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
  return "#{arr[0]}" if arr.length == 1
  return "#{arr[0]} #{last_delimiter}#{arr[1]}" if arr.length == 2

  arr.reduce('') do |sentence, item|
    arr.last == item ?
    sentence << "#{last_delimiter} #{item.to_s}" :
    sentence << "#{item.to_s}#{delimiter}"
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def emtpy_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_squares(brd)
  brd.keys.select { |num| brd[num] == PLAYER_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(emtpy_squares(brd))}):"
    square = gets.chomp.to_i
    break if emtpy_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

=begin
- find out players squares
- find an "immediate threat": two squares in a row
- mark the 3rd square to prevent player from winning

- loop over the player's squares, 
- loop over the winning lines
- does the player squares have 2 squares mark in any of the winning lines? 
- 
=end
def players_possible_wins(brd)
  player_squares = player_squares(brd)
  
  WINNING_LINES.select do |win_combo|
    values_marked = 0
    player_squares.each do |square|
      values_marked += 1 if win_combo.include?(square)
    end

    values_marked == 2 
  end
end

def find_squares_at_risk(brd)
  emtpy_squares(brd).select do |square|
    players_possible_wins(brd).any? do |win_combo|
      win_combo.include?(square)
    end
  end
end

def computer_places_piece!(brd)
  square = find_squares_at_risk(brd).sample || emtpy_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  emtpy_squares(brd).empty?
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

prompt welcome
sleep(3)

loop do
  score_board = {
    'player'=> 0,
    'computer' => 0,
    'tie' => 0
  }
  
  loop do
    board = initialize_board

    loop do
      display_board(board)
      display_score(score_board)

      player_places_piece!(board)

      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      sleep(1)
    else
      prompt "It's a tie!"
      sleep(1)
    end

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
