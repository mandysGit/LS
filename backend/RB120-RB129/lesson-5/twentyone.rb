module Formatable
  def prompt(msg)
    puts "=>  #{msg}"
  end

  def padded_display(msg)
    puts "\n    #{msg}\n\n"
  end
end

class Player
  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

class Dealer
  def initialize
    # seems like very similar to Player... do we even need this?
  end

  def deal
    # does the dealer or the deck deal?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Participant
  # what goes in here? all the redundant behaviors from Player and Dealer?
end

class Deck
  def initialize
    @deck = []
    refill_deck!
  end

  def deal
    refill_deck! if deck.empty?
    deck.shuffle!
    deck.pop
  end

  private

  def refill_deck!
    suits_and_ranks = Card::SUITS.product(Card::RANKS)

    suits_and_ranks.each do |suit, rank|
      deck << Card.new(suit, rank)
    end
  end

  private

  attr_reader :deck
end

class Card
  RANKS = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
  SUITS = %w(♥️ ♦️ ♣️ ♠️)

  def initialize(suit, rank)
   @suit = suit
   @rank = rank
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end

class Game
  include Formatable

  def initialize
    @deck = Deck.new
  end

  def start
    display_welcome
    # 52.times { @deck.deal }
    # p @deck
    # 52.times { @deck.deal }
    # deal_cards
    # show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end

  def deal_cards
  end

  def display_welcome
    padded_display("Welcome to Twenty-one! You and the dealer will be dealt two cards initially.
    You can hit to get another card or stay with the cards you currently have.
    Cards 1-10 are worth face value. Jack, Queen, King are worth 10, and
    Ace is 1 or 11.

    The objective of the game is to get as close to 21 as possible.
    If you go over 21, it's a bust and you lose that round.")
  end
end

Game.new.start