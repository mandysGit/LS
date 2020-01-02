require 'pry'

deck = {
  hearts: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
  diamonds: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
  clubs: %w(2 3 4 5 6 7 8 9 10 jack queen king ace),
  spades: %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
}

def prompt(msg)
  puts "=> #{msg} \n \n"
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
  "Dealer has: #{dealer.first} and unknown card
   You have: #{joinand(player)}"
end

def display_winner(player, dealer)
  winner = calculate_winner(player, dealer)
  winner_total = winner == 'player' ? total(player) : total(dealer)
  "Congrats!! The winner is #{winner} with a total of #{winner_total}."
end

def display_totals(player, dealer)
  "Dealer has: #{joinand(dealer)}. A total score of #{total(dealer)}.
   You have: #{joinand(player)}. A total score of #{total(player)}."
end

def calculate_winner(player, dealer)
  if total(player) <= 21 && total(dealer) <= 21
    total(player) > total(dealer) ? 'player' : 'dealer'
  else
    total(player) < total(dealer) ? 'player' : 'dealer'
  end
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

def total(cards)
  ace_total =
    case cards.count('ace')
    when 1
      (total_without_aces(cards) + 11) <= 21 ? 11 : 1
    when 2
      (total_without_aces(cards) + 12) <= 21 ? 12 : 2
    when 3
      (total_without_aces(cards) + 13) <= 21 ? 13 : 3
    when 4
      (total_without_aces(cards) + 14) <= 21 ? 14 : 4
    else
      0
    end
  ace_total + total_without_aces(cards)
end

def busted?(total)
  total > 21
end

def player_turn(deck, player, dealer)
  loop do
    prompt "hit or stay?"
    answer = gets.chomp

    if answer == 'hit'
      system 'clear'
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
    prompt display_cards(player, dealer)
    player_turn(deck, player, dealer)

    if busted?(total(player))
      system 'clear'
      prompt "You busted!"
      break
    else
      system 'clear'
      prompt "You chose to stay!"
    end

    dealer_turn(deck, dealer)

    if busted?(total(dealer))
      prompt "Dealer busted!"
    else
      prompt "Dealer chose to stay!"
    end
    break
  end

  prompt display_totals(player, dealer)
  prompt display_winner(player, dealer)

  prompt "Do you want to play again?
  Enter Y/y to play again. Enter anything else to exit."
  answer = gets.chomp
  break unless answer.downcase == ('y')
end

prompt "Thanks for playing Twenty One! Goodbye!"

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
