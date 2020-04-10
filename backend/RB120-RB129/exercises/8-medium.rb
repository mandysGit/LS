# class Card
#   attr_reader :rank, :suit

#   RANK_ORDER = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def to_s
#     "#{@rank} of #{@suit}"
#   end

#   def <=>(other)
#     if  RANK_ORDER.find_index(@rank) < RANK_ORDER.find_index(other.rank)
#       -1
#     elsif RANK_ORDER.find_index(@rank) > RANK_ORDER.find_index(other.rank)
#       1
#     else
#       0
#     end
#   end

#   def ==(other)
#     @rank == other.rank
#   end
# end

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards

# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

# Further Exploration
class Card
  attr_reader :rank, :suit

  RANK_ORDER = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SUIT_ORDER = ['Diamonds', 'Clubs', 'Hearts', 'Spades']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  require 'pry'
  def <=>(other)
    return compare_rank(other) if compare_rank(other) != 0
    return compare_suit(other)
  end

  def compare_rank(other)
    RANK_ORDER.find_index(@rank) <=> RANK_ORDER.find_index(other.rank)
  end

  def compare_suit(other)
    SUIT_ORDER.find_index(@suit) <=> SUIT_ORDER.find_index(other.suit)
  end

  def ==(other)
    @rank == other.rank && @suit == other.suit
  end
end

puts Card.new(2, 'Hearts') == Card.new(2, 'Hearts')

cards = [Card.new(4, 'Diamonds'),
         Card.new(4, 'Clubs'),
         Card.new(4, 'Hearts'),
         Card.new(4, 'Spades')]

puts cards.min == Card.new(4, 'Diamonds')
puts cards.max == Card.new(4, 'Spades')
