deck = { hearts: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         diamonds: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         clubs: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'],
         spades: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'] 
        }

player = []
dealer = []

def prompt(msg)
  puts "=> #{msg}"
end
def shuffle!(deck)
  deck.each_pair do |_, cards|
    cards.shuffle!
  end
  deck
end

def deal_card!(deck, current_player)
  shuffle!(deck)
  suit = deck.keys.sample
  current_player << deck[suit].pop
end

def display_cards(player, dealer)
  "Dealer has: #{dealer.first} and unknown card
  You have: #{player[0]} and #{player[1]}"
end

2.times do 
  deal_card!(deck, player)
  deal_card!(deck, dealer)
end

# pp deck
# p player
# p dealer
prompt display_cards(player, dealer)