class Move
  VALUES = ['r', 'p', 'sc', 'sp', 'l']

  WIN_COMBINATIONS = {
    'r' => ['l', 'sc'],
    'l' => ['p', 'sp'],
    'sp' => ['r', 'sc'],
    'sc' => ['l', 'p'],
    'p' => ['r', 'sp']
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

class Rock < Move
end

class Paper < Move
end

class Scissors < Move
end

class Lizard < Move
end

class Spock < Move
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  private

  def select_move(choice)
    case choice
    when 'r' then self.move = Rock.new(choice)
    when 'p' then self.move = Paper.new(choice)
    when 'sc' then self.move = Scissors.new(choice)
    when 'l' then self.move = Lizard.new(choice)
    when 'sp' then self.move = Spock.new(choice)
    end
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
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
      'l'  for lizard,
      'sp' for spock"
      )
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end

    select_move(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    select_move(Move::VALUES.sample)
  end
end

class Game
  WIN_SCORE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "
    Welcome #{human.name}!
    Let's play Rock, Paper, Scissors!
    You must win #{WIN_SCORE} matches to win the entire game.
    "
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_score
    puts "
    ~~~~~Scoreboard~~~~~
    #{human.name} has won #{human.score} matches.
    #{computer.name} has won #{computer.score} matches.
    "
  end

  def add_point(player)
    player.score = player.score + 1
  end

  def clear_score
    human.score = 0
    computer.score = 0
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
      puts "#{match_winner.name} won!"
      add_point(match_winner)
    else
      puts "It's a tie!"
    end
  end

  def display_grand_winner
    puts "
    #{grand_winner.name} is the grand winner,
    winning a total of #{WIN_SCORE} matches!"
  end

  def match_ended?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
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
        break
      end
    end
  end

  def play
    display_welcome_message

    loop do
      clear_score
      start_match
      break unless play_again?
    end

    display_goodbye_message
  end
end

Game.new.play
