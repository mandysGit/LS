WIN_SCORE = 5

def prompt(msg)
  puts "=> #{msg}"
end

def shuffle!(deck)
  deck.each_pair do |_, cards|
    cards.shuffle!
  end
end

def deal_card!(deck, current_player_cards)
  shuffle!(deck)
  suit = deck.keys.sample
  current_player_cards << deck[suit].pop
end

def deal_initial_cards!(deck, player, dealer)
  2.times do
    deal_card!(deck, player)
    deal_card!(deck, dealer)
  end
end

def display_cards(player, dealer)
  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Dealer has: #{dealer.first} and unknown card.
    You have: #{joinand(player)}.
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   "
end

def display_game_result(player_total, dealer_total)
  return "It's a Tie!" if game_result(player_total, dealer_total) == 'tie'
  "The winner of this round is #{game_result(player_total, dealer_total)}!"
end

def display_totals(player_cards, dealer_cards, player_total, dealer_total)
  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Dealer has: #{joinand(dealer_cards)}. A total of #{dealer_total}.
    You have: #{joinand(player_cards)}. A total of #{player_total}.
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   "
end

def game_result(player_total, dealer_total)
  if busted?(player_total)
    'dealer'
  elsif busted?(dealer_total)
    'player'
  elsif player_total == dealer_total
    'tie'
  else
    player_total > dealer_total ? 'player' : 'dealer'
  end
end

def joinand(arr, delimiter=', ', word='and')
  if arr.size == 2
    arr.join(" #{word} ")
  elsif arr.size > 2
    arr[0...arr.size - 1].join(delimiter) + " #{word} #{arr.last}"
  end
end

def total(cards)
  sum = 0
  cards.each do |card|
    case card
    when 'jack', 'queen', 'king' then sum += 10
    when 'ace' then sum += 11
    else sum += card.to_i
    end
  end

  cards.count('ace').times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(total)
  total > 21
end

def validate_answer(answer)
  loop do
    answer = gets.chomp.downcase
    break if answer == 'h' || answer == 's'
    prompt "#{answer} is an invalid choice.
    Please choose hit or stay. Enter 'h' or 's'"
  end

  answer
end

def player_turn(deck, player_cards, dealer_cards, player_total)
  loop do
    prompt display_cards(player_cards, dealer_cards)
    prompt "You have a total of #{player_total}"
    prompt "hit or stay? Enter 'h' or 's'"

    answer = validate_answer(answer)
    if answer == 'h'
      system 'clear'
      deal_card!(deck, player_cards)
      player_total = total(player_cards)
    end

    break if answer == 's' || busted?(player_total)
  end
end

def dealer_turn(deck, dealer_cards, dealer_total)
  loop do
    break if dealer_total >= 17 || busted?(dealer_total)
    deal_card!(deck, dealer_cards)
    dealer_total = total(dealer_cards)
  end
end

def play_again?
  prompt "Do you want to play again?
   Enter Y/y to play again. Enter anything else to exit."
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def welcome
  "Welcome to Twenty-one! You and the dealer will be dealt two cards initially.
   You can hit to get another card or stay with the cards you currently have.

   Cards 1-10 are worth face value. Jack, Queen, King are worth 10, and
   Ace is 1 or 11.

   The objective of the game is to get as close to 21 as possible.
   If you go over 21, it's a bust and you lose that round.
   You must win #{WIN_SCORE} rounds to win the entire game.
  "
end

def display_score(score_board)
  "~~~~~~Scoreboard~~~~~~~~
   Player has won #{score_board['player']} rounds.
   Dealer has won #{score_board['dealer']} rounds.
   There were #{score_board['tie']} ties.
   ~~~~~~~~~~~~~~~~~~~~~~~~
  "
end

def update_score_board!(score_board, player_total, dealer_total)
  result = game_result(player_total, dealer_total)
  score_board[result] += 1
end

def match_ended?(score_board)
  score_board['player'] == WIN_SCORE || score_board['dealer'] == WIN_SCORE
end

def display_match_winner(score_board)
  if score_board['player'] == WIN_SCORE
    "Congrats! You won #{WIN_SCORE} matches, You are the winner!"
  elsif score_board['dealer'] == WIN_SCORE
    "Congrats! Dealer won #{WIN_SCORE} matches, Dealer is the winner!"
  end
end

prompt welcome

loop do
  score_board = {
    'player' => 0,
    'dealer' => 0,
    'tie' => 0
  }

  deck = {
    hearts: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
    diamonds: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
    clubs: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
    spades: %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
  }

  loop do
    player_cards = []
    dealer_cards = []
    player_total = 0
    dealer_total = 0

    loop do
      deal_initial_cards!(deck, player_cards, dealer_cards)
      player_total = total(player_cards)
      dealer_total = total(dealer_cards)

      prompt display_score(score_board)
      player_turn(deck, player_cards, dealer_cards, player_total)
      player_total = total(player_cards)

      if busted?(player_total)
        prompt "You busted!!"
        break
      else
        system 'clear'
        prompt "You chose to stay!"
      end

      dealer_turn(deck, dealer_cards, dealer_total)
      dealer_total = total(dealer_cards)

      if busted?(dealer_total)
        prompt "Dealer busted!!"
      else
        prompt "Dealer chose to stay!"
      end
      break
    end

    prompt display_game_result(player_total, dealer_total)
    prompt display_totals(player_cards, dealer_cards, player_total, dealer_total)
    update_score_board!(score_board, player_total, dealer_total)

    if match_ended?(score_board)
      prompt(display_match_winner(score_board))
      display_score(score_board)
      break
    end
  end

  break unless play_again?
end

prompt "Thanks for playing Twenty One! Goodbye!"
