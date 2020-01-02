deck = {
  hearts: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
  diamonds: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
  clubs: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
  spades: %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
}

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
  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Dealer has: #{dealer.first} and unknown card.
    You have: #{joinand(player)}.
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def display_game_result(player_total, dealer_total)
  return "It's a Tie!" if game_result(player_total, dealer_total) == 'tie'
  "Congrats!! The winner is #{game_result(player_total, dealer_total)}!"
end

def display_totals(player_cards, dealer_cards, player_total, dealer_total)
  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Dealer has: #{joinand(dealer_cards)}. A total of #{dealer_total}.
    You have: #{joinand(player_cards)}. A total of #{player_total}.
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
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
    prompt "player total: #{player_total}"
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

loop do
  player_cards = []
  dealer_cards = []
  player_total = 0
  dealer_total = 0

  loop do
    system 'clear'
    deal_initial_cards!(deck, player_cards, dealer_cards)
    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    player_turn(deck, player_cards, dealer_cards, player_total)
    player_total = total(player_cards)
    system 'clear'

    if busted?(player_total)
      prompt "You busted!!"
      break
    else
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

  prompt display_totals(player_cards, dealer_cards, player_total, dealer_total)
  prompt display_game_result(player_total, dealer_total)

  break unless play_again?
end

prompt "Thanks for playing Twenty One! Goodbye!"
