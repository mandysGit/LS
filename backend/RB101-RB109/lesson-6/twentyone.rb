deck = { :hearts   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :diamonds => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :clubs    => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :spades   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace] }

def shuffle!(deck)
  deck.each_pair do |_, cards|
    cards.shuffle!
  end
  deck
end
