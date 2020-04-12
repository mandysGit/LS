require 'pry'
# 9) Poker!
class Card
  attr_reader :rank, :suit

  RANK_ORDER = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def <=>(other)
    compare_rank(other)
  end

  def ==(other)
    @rank == other.rank
  end

  def compare_rank(other)
    RANK_ORDER.find_index(@rank) <=> RANK_ORDER.find_index(other.rank)
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def create_deck
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end

    @deck
  end

  def shuffle_deck
    @deck.shuffle!
  end

  def reset
    create_deck
    shuffle_deck
  end
end

class PokerHand
  def initialize(deck)
    @hand = []
    deal_hand(deck)
  end

  def deal_hand(deck)
    5.times { @hand << deck.draw }
  end

  def print
    @hand.each { |card| puts card.to_s}
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    order = @hand.map { |card| Card::RANK_ORDER.find_index(card.rank) }.sort
    order == [9, 10, 11, 12, 13] && flush?
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    ranks.any? { |rank| ranks.count(rank) == 4 }
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    suits.all? { |suit| suit == suits.first }
  end

  def straight?
    order = @hand.map { |card| Card::RANK_ORDER.find_index(card.rank) }.sort
    consecutive = true

    3.times { |idx| consecutive = false if order[idx+1] - order[idx] != 1 }

    consecutive
  end

  def three_of_a_kind?
    ranks.any? { |rank| ranks.count(rank) == 3 }
  end

  def two_pair?
    ranks.uniq.size == 3
  end

  def pair?
    ranks.any? { |rank| ranks.count(rank) == 2 }
  end

  def ranks
    @hand.map(&:rank)
  end

  def suits
    @hand.map(&:suit)
  end
end


# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate


# # Danger danger danger: monkey
# # patching for testing purposes.
class Array
  alias_method :draw, :pop
end


# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'