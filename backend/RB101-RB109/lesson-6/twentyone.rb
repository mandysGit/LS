require 'pry'

deck = { hearts: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         diamonds: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         clubs: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         spades: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'] 
        }

player = []
dealer = []
player_total = 0
dealer_total = 0

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

def display_cards(player, dealer)
  "Dealer has: #{dealer.first} and unknown card
   You have: #{joinand(player)}"
end

def joinand(arr, delimiter=', ', word='and')
  if arr.size == 2
    arr.join(" #{word} ")
  elsif arr.size > 2
    arr[0...arr.size - 1].join(delimiter) + " #{word} #{arr.last}"
  end
end

def total_without_aces(current_player_cards)
  sum = 0
  current_player_cards.each do |card|
    case card
    when 'jack', 'queen', 'king' then sum += 10
    when 'ace' then sum += 0
    else
      sum += card.to_i
    end
  end
  sum
end

def total(current_player_cards)
  sum = total_without_aces(current_player_cards)
  ace_total = 0 

  case current_player_cards.count('ace')
  when 1
    (sum += 11) <= 21 ? ace_total += 11 : ace_total += 1
  when 2
    (sum += 12) <= 21 ? ace_total += 12 : ace_total += 2
  when 3
    (sum += 13) <= 21 ? ace_total += 13 : ace_total += 3
  when 4
    (sum += 14) <= 21 ? ace_total += 14 : ace_total += 4
  end

  ace_total + total_without_aces(current_player_cards)
end

def deal_initial_cards!(deck, player, dealer)
  2.times do 
    deal_card!(deck, player)
    deal_card!(deck, dealer)
  end
end

def busted?(total)
  total > 21
end

def display_winner(player, dealer)
  winner = calculate_winner(player, dealer)
  winner_total = winner == 'player' ? total(player) : total(dealer)
  "Congratulations, the winner is #{winner} with a total of #{winner_total}."
end

def calculate_winner(player, dealer)
  total(player) > total(dealer) ? 'player' : 'dealer'
end

def display_totals(player, dealer)
  "Dealer has: #{joinand(dealer)}. A total score of #{total(dealer)}.
   You have: #{joinand(player)}. A total score of #{total(player)}."
end

def player_turn(deck, player, dealer)
  loop do # Player Turn
    prompt "hit or stay?"
    answer = gets.chomp
  
    if answer == 'hit'
      deal_card!(deck, player)
      prompt display_cards(player, dealer)
      prompt "player total: #{total(player)}"
    end
  
    if answer == 'stay' || busted?(total(player))
      break
    elsif answer != 'stay' && answer != 'hit'
      puts "#{answer} is an invalid choice. Please choose hit or stay."
    end
  end
  
  if busted?(total(player))
    puts "You busted"
  else
    puts "You chose to stay!"
  end
end

def dealer_turn(deck, player, dealer)
  loop do # Dealer Turn
    break if total(dealer) >= 17 || busted?(total(dealer))
    deal_card!(deck, dealer)
  end
  
  if busted?(total(dealer))
    puts "Dealer busted"
  else
    puts "Dealer chose to stay!"
  end
end

deal_initial_cards!(deck, player, dealer)
prompt display_cards(player, dealer)
player_turn(deck, player, dealer)
dealer_turn(deck, player, dealer)

prompt display_totals(player, dealer)
prompt display_winner(player, dealer)

# Test cases for total method
# player = ['ace', 10, 5]
# p total(player) == 16

# player = ['ace', 5, 5]
# p total(player) == 21

# player = ['ace','ace', 5, 5]
# p total(player) == 12

# player = ['ace', 'ace', 5, 4]
# p total(player) == 21

# player = ['ace','ace', 'ace', 'jack', 5]
# p total(player) == 18

# player = ['ace', 'ace', 'ace', 5, 3]
# p total(player) == 21

# player = ['ace','ace', 'ace', 'ace', 'queen', 5]
# p total(player) == 19

# player = ['ace', 'ace', 'ace', 'ace', 5, 2]
# p total(player) == 21