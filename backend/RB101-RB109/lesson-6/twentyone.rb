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
    Dealer has: #{dealer.first} and unknown card
    You have: #{joinand(player)}
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def display_game_result(player, dealer)
  return "It's a Tie!" if game_result(player, dealer) == 'tie'
  "Congrats!! The winner is #{game_result(player, dealer)}!"
end

def display_totals(player, dealer)
  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Dealer has: #{joinand(dealer)}. A total of #{total(dealer)}.
    You have: #{joinand(player)}. A total of #{total(player)}.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def game_result(player, dealer)
  if busted?(total(player))
    'dealer'
  elsif busted?(total(dealer))
    'player'
  elsif total(player) == total(dealer)
    'tie'
  else
    total(player) > total(dealer) ? 'player' : 'dealer'
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

def player_turn(deck, player, dealer)
  loop do
    prompt display_cards(player, dealer)
    prompt "player total: #{total(player)}"
    prompt "hit or stay? Enter 'h' or 's'"

    answer = validate_answer(answer)
    if answer == 'h'
      system 'clear'
      deal_card!(deck, player)
    end

    break if answer == 's' || busted?(total(player))
  end
end

def dealer_turn(deck, dealer)
  loop do
    break if total(dealer) >= 17 || busted?(total(dealer))
    deal_card!(deck, dealer)
  end
end

loop do
  player = []
  dealer = []

  loop do
    system 'clear'
    deal_initial_cards!(deck, player, dealer)
    player_turn(deck, player, dealer)

    if busted?(total(player))
      prompt "You busted!!"
      break
    else
      prompt "You chose to stay!"
    end

    dealer_turn(deck, dealer)

    if busted?(total(dealer))
      prompt "Dealer busted!!"
    else
      prompt "Dealer chose to stay!"
    end
    break
  end

  prompt display_totals(player, dealer)
  prompt display_game_result(player, dealer)

  prompt "Do you want to play again?
   Enter Y/y to play again. Enter anything else to exit."
  answer = gets.chomp
  break unless answer.downcase == ('y')
end

prompt "Thanks for playing Twenty One! Goodbye!"

