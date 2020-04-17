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
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Card
  def initialize
    # what are the "states" of a card?
  end
end

class Game
  include Formatable
  WIN_SCORE = 2

  def start
    display_welcome
    # deal_cards
    # show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end

  def display_welcome
    padded_display("Welcome to Twenty-one! You and the dealer will be dealt two cards initially.
    You can hit to get another card or stay with the cards you currently have.
    Cards 1-10 are worth face value. Jack, Queen, King are worth 10, and
    Ace is 1 or 11.

    The objective of the game is to get as close to 21 as possible.
    If you go over 21, it's a bust and you lose that round.
    You must win #{WIN_SCORE} rounds to win the entire game.")
  end
end

Game.new.start