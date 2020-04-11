# 9) Deck of Cards
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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.

p drawn.map(&:to_s)
p drawn2.map(&:to_s)