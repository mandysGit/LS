module Promptable
  def prompt(msg)
    puts "=> #{msg}"
  end

  def display(msg)
    puts "
    #{msg}"
  end
end

class Move
  VALUES = {
    'r' => 'rock',
    'l' => 'lizard',
    'sp' => 'spock',
    'sc' => 'scissors',
    'p' => 'paper'
  }

  WIN_COMBINATIONS = {
    'r' => %w(l sc),
    'l' => %w(p sp),
    'sp' => %w(r sc),
    'sc' => %w(l p),
    'p' => %w(r sp)
  }

  def initialize(value)
    @value = value
  end

  def to_s
    VALUES[value]
  end

  def >(other_move)
    WIN_COMBINATIONS[value].include?(other_move.value)
  end

  protected

  attr_reader :value
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    @score = 0
    @move_history = []
  end
end

class Human < Player
  include Promptable

  def choose
    choice = nil
    loop do
      prompt_user_for_choices
      choice = gets.chomp
      break if Move::VALUES.keys.include? choice
      prompt("Sorry, invalid choice.")
    end

    self.move = Move.new(choice)
    move_history << move.to_s
  end

  private

  def set_name
    n = ''
    loop do
      prompt("What's your name?")
      n = gets.chomp
      break unless n.empty?
      prompt("Sorry, must enter a value.")
    end
    self.name = n
  end

  def prompt_user_for_choices
    prompt("Choose one:
    'r'  for rock,
    'p'  for paper,
    'sc' for scissors,
    'l'  for lizard,
    'sp' for spock")
  end
end

class Computer < Player
  def initialize
    @personality = [R2D2, Hal, Chappie, Sonny, Number5].sample.new
    super
  end

  def choose
    self.move = personality.choose
    move_history << move.to_s
  end

  private

  attr_reader :personality

  def set_name
    self.name = personality.name
  end
end

class R2D2 < Computer
  def initialize; end

  def choose
    Move.new('r')
  end

  def name
    self.class.to_s
  end
end

class Hal < Computer
  def initialize; end

  def choose
    Move.new(%w(sc sc sc sc sp sp l l r).sample)
  end

  def name
    self.class.to_s
  end
end

class Chappie < Computer
  def initialize; end

  def choose
    Move.new(%w(l l l l l sp p sc r).sample)
  end

  def name
    self.class.to_s
  end
end

class Sonny < Computer
  def initialize; end

  def choose
    Move.new('p')
  end

  def name
    self.class.to_s
  end
end

class Number5 < Computer
  def initialize; end

  def choose
    Move.new(Move::VALUES.keys.sample)
  end

  def name
    self.class.to_s
  end
end

class Game
  include Promptable

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message

    loop do
      clear_score
      clear_move_history
      start_match
      break unless play_again?
      clear_screen
    end

    display_goodbye_message
  end

  private

  WIN_SCORE = 3
  attr_accessor :human, :computer

  def display_welcome_message
    display("Welcome #{human.name}!
    Let's play the game of Rock, Paper Scissors, Spock, Lizard!")
  end

  def display_rules
    display("The rules are:
    Rock crushes Lizard and crushes Scissors.
    Paper covers Rock and disproves Spock.
    Scissors cut Paper and decapitates Lizard.
    Spock smashes Scissors and vaporizes Rock.
    Lizard poisons Spock and eats Paper.
    You must win #{WIN_SCORE} matches to win the entire game.")
  end

  def display_goodbye_message
    prompt("\u{1F600} Thank You for playing Rock, Paper, Scissors! Good bye!")
  end

  def display_moves
    display("#{human.name} chose #{human.move}.")
    display("#{computer.name} chose #{computer.move}.")
  end

  def display_score
    display("~~~~~Scoreboard~~~~~
    #{human.name} has won #{human.score} matches.
    #{computer.name} has won #{computer.score} matches.")
  end

  def display_move_history
    display("~~~~~Game Recap~~~~~")

    human.move_history.size.times do |index|
      display("Match #{index + 1}:
      #{human.name} chose #{human.move_history[index]}
      #{computer.name} chose #{computer.move_history[index]}")
    end
  end

  def add_point(player)
    player.score = player.score + 1
  end

  def clear_score
    human.score = 0
    computer.score = 0
  end

  def clear_move_history
    human.move_history = []
    computer.move_history = []
  end

  def match_winner
    return human if human.move > computer.move
    return computer if computer.move > human.move
  end

  def grand_winner
    return human if human.score == WIN_SCORE
    return computer if computer.score == WIN_SCORE
  end

  def display_match_winner
    if match_winner
      display("#{match_winner.name} won!")
      add_point(match_winner)
    else
      display("It's a tie!")
    end
  end

  def display_grand_winner
    display("#{grand_winner.name} is the grand winner,
    winning a total of #{WIN_SCORE} matches!")
  end

  def match_ended?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def play_again?
    answer = nil
    loop do
      prompt("Would you like to play again? (y/n)")
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      prompt("Sorry, must be y or n")
    end

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def clear_screen
    sleep(2)
    system 'clear'
  end

  def start_match
    loop do
      display_rules
      display_score
      human.choose
      computer.choose
      display_moves
      display_match_winner
      clear_screen

      if match_ended?
        display_score
        display_grand_winner
        display_move_history
        break
      end
    end
  end
end

Game.new.play
