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
  attr_accessor :cards
  attr_reader :name

  def initialize
    @cards = []
    set_name
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

  private

  attr_writer :name
end

class Player < Participant
  include Formatable
  private

  def set_name
    n = ''
    loop do
      prompt "Hi there! What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt "Sorry, must enter a value."
    end
    self.name = n
  end
end

class Dealer < Participant
  DEALER_LIMIT = 17

  private

  def set_name
    self.name = ['Catalina', 'Synapse'].sample
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

class TwentyOne
  include Formatable

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    loop do
      clear
      clear_hands
      display_welcome
      deal_initial_cards!

      display_initial_cards
      player_turn
      dealer_turn if !player.busted?

      clear
      display_turn_result(player)
      display_turn_result(dealer)
      display_game_result

      break unless play_again?
    end

    display_goodbye
  end

  private

  attr_reader :deck, :player, :dealer

  def clear_hands
    player.cards = []
    dealer.cards = []
  end

  def play_again?
    answer = nil
    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      prompt "Sorry, must be 'y' or 'n'."
    end

    answer == 'y'
  end

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
      dealer.name
    elsif dealer.busted?
      player.name
    elsif player.total == dealer.total
      'tie'
    else
      player.total > dealer.total ? player.name : dealer.name
    end
  end

  def display_winner
    padded_display "🎊🥇The winner is #{winner}!🥇🎉" if winner
    padded_display "It's a tie!" if !winner
  end

  def display_turn_result(participant)
    padded_display "#{participant.name} busted! 💥😟" if participant.busted?
    padded_display "#{participant.name} chose to stay!" if !participant.busted?
  end

  def display_score
    padded_display "#{dealer.name} has a total of: #{dealer.total}"
    padded_display "#{player.name} has a total of: #{player.total}"
  end

  def display_cards
    padded_display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #{dealer.name} has: #{joinand(dealer.cards)}.
    #{player.name} has: #{joinand(player.cards)}.
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  end

  def display_initial_cards
    padded_display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #{dealer.name} has: #{dealer.cards.first} and unknown card.
    #{player.name} has: #{joinand(player.cards)}.
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  end

  def display_welcome
    padded_display("Hi #{player.name}! ✨Welcome to Twenty-one! ✨

    You and the #{dealer.name} will be dealt two cards initially.
    You can hit to get another card or stay with the cards you have.
    Cards 1-10 are worth face value.
    Jack, Queen, King are worth 10, and Ace is 1 or 11.

    The objective of the game is to get as close to 21 as possible.
    If you go over 21, it's a bust and you lose that round.")
  end

  def display_goodbye
    padded_display("Thank you for playing Twenty One! Goodbye!")
  end

  def clear
    system 'clear'
  end
end

TwentyOne.new.start