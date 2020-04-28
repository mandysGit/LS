module Formatable
  def prompt(msg)
    puts "=>  #{msg}"
  end

  def padded_display(msg)
    puts "\n    #{msg}\n"
  end

  def joinand(cards, delimiter=', ', word='and')
    arr = cards.map(&:to_s)

    if arr.size == 2
      arr.join(" #{word} ")
    elsif arr.size > 2
      arr[0...arr.size - 1].join(delimiter) + " #{word} #{arr.last}"
    end
  end
end

class Participant
  attr_reader :cards, :name

  def initialize
    @cards = []
  end

  def busted?
    total > Card::TWENTY_ONE
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
      sum -= 10 if sum > Card::TWENTY_ONE
    end

    sum
  end
end

class Player < Participant
  def initialize
    super
    @name = 'Mandy'
  end
end

class Dealer < Participant
  DEALER_LIMIT = 17

  def initialize
    super
    @name = 'Dealer'
  end
end

class Deck
  def initialize
    @deck = []
    refill_deck!
  end

  def deal_one
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
  SUITS = %w(❤ ♦️ ♣️ ♠️)
  TWENTY_ONE = 21

  attr_reader :suit, :rank

  def initialize(suit, rank)
   @suit = suit
   @rank = rank
  end

  def to_s
    "#{rank} of #{suit}"
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

    display_initial_cards
    player_turn
    dealer_turn if !player.busted?

    clear
    display_turn_result(player)
    display_turn_result(dealer)
    display_game_result
  end

  private

  attr_reader :deck, :player, :dealer

  def display_game_result
    display_cards
    display_score
    display_winner
  end

  def dealer_turn
    loop do
      break if dealer.total >= Dealer::DEALER_LIMIT || dealer.busted?
      dealer.cards << deck.deal_one
    end
  end

  def player_turn
    loop do
      prompt "You have a total of #{player.total}"
      prompt "hit or stay? Enter 'h' or 's'"

      answer = validate(answer)
      player.cards << deck.deal_one if answer == 'h'
      break if answer == 's' || player.busted?
    end
  end

  def validate(answer)
    loop do
      answer = gets.chomp.downcase
      break if answer == 'h' || answer == 's'
      prompt "#{answer} is an invalid choice.
      Please choose hit or stay. Enter 'h' or 's'"
    end

    answer
  end

  def deal_initial_cards!
    2.times do
      player.cards << deck.deal_one
      dealer.cards << deck.deal_one
    end
  end

  def winner
    if player.busted?
      'dealer'
    elsif dealer.busted?
      'player'
    elsif player.total == dealer.total
      'tie'
    else
      player.total > dealer.total ? 'player' : 'dealer'
    end
  end

  def display_winner
    padded_display "🎊🥇The winner is #{winner}!🥇🎉" if winner
    padded_display "It's a tie!" if !winner
  end

  def display_turn_result(participant)
    padded_display "#{participant.name} busted! 💥😟" if participant.busted?
    padded_display "#{participant.name} chose to stay! 👍" if !participant.busted?
  end

  def display_score
    padded_display "Player has a total of: #{player.total}"
    padded_display "Dealer has a total of: #{dealer.total}"
  end

  def display_cards
    padded_display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Dealer has: #{joinand(dealer.cards)}.
    You have: #{joinand(player.cards)}.
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  end

  def display_initial_cards
    padded_display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Dealer has: #{dealer.cards.first} and unknown card.
    You have: #{joinand(player.cards)}.
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
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

  def clear
    system 'clear'
  end
end

Game.new.start