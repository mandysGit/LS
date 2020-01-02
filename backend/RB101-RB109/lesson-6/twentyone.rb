require 'pry'

deck = { hearts: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         diamonds: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         clubs: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         spades: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'] 
        }

player = ['ace']
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

2.times do 
  deal_card!(deck, player)
  deal_card!(deck, dealer)
end

# Test cases total method
player = ['ace', 10, 5]
p total(player) == 16

player = ['ace', 5, 5]
p total(player) == 21

player = ['ace','ace', 5, 5]
p total(player) == 12

player = ['ace', 'ace', 5, 4]
p total(player) == 21

player = ['ace','ace', 'ace', 'jack', 5]
p total(player) == 18

player = ['ace', 'ace', 'ace', 5, 3]
p total(player) == 21

player = ['ace','ace', 'ace', 'ace', 'queen', 5]
p total(player) == 19

player = ['ace', 'ace', 'ace', 'ace', 5, 2]
p total(player) == 21

# pp deck
# p player
# p dealer
# prompt display_cards(player, dealer)
# p total_without_aces(player)
# p total(player)