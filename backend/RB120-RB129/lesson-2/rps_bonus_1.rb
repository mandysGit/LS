require 'pry'

class Rock
  def greater_than(other_move)
    ['Scissors', 'Lizard'].include? other_move.to_s
  end

  def less_than(other_move)
    ['Spock', 'Paper'].include? other_move.to_s
  end

  def to_s
    'Rock'
  end
end

class Scissors
  def greater_than(other_move)
    ['Paper', 'Lizard'].include? other_move.to_s
  end

  def less_than(other_move)
    ['Spock', 'Rock'].include? other_move.to_s
  end

  def to_s
    'Scissors'
  end
end

class Paper
  def greater_than(other_move)
    ['Rock', 'Spock'].include? other_move.to_s
  end

  def less_than(other_move)
    ['Scissors', 'Lizard'].include? other_move.to_s
  end

  def to_s
    'Paper'
  end
end

class Lizard
  def greater_than(other_move)
    ['Paper', 'Spock'].include? other_move.to_s
  end

  def less_than(other_move)
    ['Scissors', 'Rock'].include? other_move.to_s
  end

  def to_s
    'Lizard'
  end
end

class Spock
  def greater_than(other_move)
    ['Scissors', 'Rock'].include? other_move.class
  end

  def less_than(other_move)
    ['Lizard', 'Paper'].include? other_move.class
  end

  def to_s
    'Spock'
  end
end

class Move
  VALUES = ['r', 'p', 'sc', 'sp', 'l']

  def initialize(value)
    @value = value
    @choice = initialize_choice
  end

  def initialize_choice
    case value
    when 'r'
      Rock.new
    when 'p'
      Scissors.new
    when 'sc'
      Paper.new
    when 'sp'
      Spock.new
    when 'l'
      Lizard.new
    end
  end

  def to_s
    choice.to_s
  end

  def >(other)
    choice.greater_than(other.choice)
  end

  def <(other)
    choice.less_than(other.choice)
  end

  protected

  attr_reader :choice

  private

  attr_reader :value
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "Whats your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts(
        "Choose one:
      'r'  for rock,
      'p'  for paper,
      'sc' for scissors,
      'sp' for spock,
      'l' for lizard"
      )
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'Chappie', 'Sonny', 'Maki'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Game
  attr_accessor :human, :computer
  attr_reader :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      score.add_point('human')
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      score.add_point('computer')
    else
      puts "It's a tie!"
      score.add_point('tie')
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        puts score.display(human.name, computer.name)
        # TODO:
        # refactor this IF conditional into a method
        # display grand winner
        if score.human == 10 || score.computer == 10
          display_winner
          score.clear_points
          break
        end
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

class Score
  attr_reader :human, :computer, :tie

  def initialize
    @human = 0
    @computer = 0
    @tie = 0
  end

  def clear_points
    self.human = 0
    self.computer = 0
    self.tie = 0
  end

  def add_point(player)
    case player
    when 'human' then self.human = human + 1
    when 'computer' then self.computer = computer + 1
    when 'tie' then self.tie = tie + 1
    end
  end

  def display(player_name, computer_name)
    "Scoreboard~~~~~
    #{player_name} has won #{human} rounds.
    #{computer_name} has won #{computer} rounds.
    There were #{tie} ties.
   "
  end

  private

  attr_writer :human, :computer, :tie
end

Game.new.play
