module Formatable
  def prompt(msg)
    puts "=>  #{msg}"
  end

  def padded_display(msg)
    puts "\n    #{msg}\n\n"
  end
end
class Participant
  attr_reader :cards

  def initialize
    @cards = []
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    sum = 0
    cards.each do |card|
      case card.rank
      when 'jack', 'queen', 'king' then sum += 10
      when 'ace' then sum += 11
      else sum += card.rank.to_i
      end
    end

    cards.map(&:rank).count('ace').times do
      sum -= 10 if sum > Card::WHATEVER_ONE
    end

    sum
  end
end

class Player < Participant
end

class Dealer < Participant
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
  WHATEVER_ONE = 21

  attr_reader :rank

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
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome
    deal_initial_cards!
    # show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end

  private

  attr_reader :deck, :player, :dealer

  def deal_initial_cards!
    2.times do
      player.cards << deck.deal
      dealer.cards << deck.deal
    end
  end

  def display_welcome
    padded_display("Welcome to Twenty-one!

    You and the dealer will be dealt two cards initially.
    You can hit to get another card or stay with the cards you currently have.
    Cards 1-10 are worth face value. Jack, Queen, King are worth 10, and
    Ace is 1 or 11.

    The objective of the game is to get as close to 21 as possible.
    If you go over 21, it's a bust and you lose that round.")
  end
end

Game.new.start