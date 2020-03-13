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
  VALUES = ['r', 'p', 'sc', 'sp', 'l']

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
    value
  end

  def >(other_move)
    WIN_COMBINATIONS[value].include?(other_move.to_s)
  end

  private

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
      break if Move::VALUES.include? choice
      prompt("Sorry, invalid choice.")
    end

    self.move = Move.new(choice)
    move_history << choice
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
  def choose
    case name
    when 'R2D2' then self.move = Move.new('r')
    when 'Hal' then self.move = Move.new(['sc', 'sc','sc','r'].sample)
    when 'Chappie' then self.move = Move.new(['p', 'p','p','r'].sample)
    when 'Sonny' then self.move = Move.new(['sp', 'sp','sp','r','l'].sample)
    when 'Number 5' then self.move = Move.new(Move::VALUES.sample)
    end
    move_history << move.to_s
  end

  private

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
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
    end

    display_goodbye_message
  end

  private

  WIN_SCORE = 3
  attr_accessor :human, :computer

  def display_welcome_message
    display("Welcome #{human.name}!
    Let's play Rock, Paper, Scissors!
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

  def start_match
    loop do
      display_score
      human.choose
      computer.choose
      display_moves
      display_match_winner
      sleep(1)
      system 'clear'

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
