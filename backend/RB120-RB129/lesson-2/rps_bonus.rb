class Move
  VALUES = ['r', 'p', 'sc']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'sc'
  end

  def rock?
    @value == 'r'
  end

  def paper?
    @value == 'p'
  end

  def to_s
    @value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
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
      'sc' for scissors"
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
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
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
    puts "#{computer.name} chose move #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      score.human = score.human + 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      score.computer = score.computer + 1
    else
      puts "It's a tie!"
      score.tie = score.tie + 1
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

  def display_score
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
        break if score.human == 10 || score.computer == 10
      end

      break unless play_again?
    end
    display_goodbye_message
  end
end

class Score
  attr_accessor :human, :computer, :tie

  def initialize
    @human = 0
    @computer = 0
    @tie = 0
  end

  def display(player_name, computer_name)
    "Scoreboard~~~~~
    #{player_name} has won #{human} rounds.
    #{computer_name} has won #{computer} rounds.
    There were #{tie} ties.
   "
  end
end

RPSGame.new.play
