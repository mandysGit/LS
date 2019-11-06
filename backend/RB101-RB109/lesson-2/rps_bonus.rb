VALID_CHOICES = ['r', 'p', 'sc', 'sp', 'l']

WIN_COMBINATIONS = {
  'r' => ['l', 'sc'],
  'l' => ['p', 'sp'],
  'sp' => ['r', 'sc'],
  'sc' => ['l', 'p'],
  'p' => ['r', 'sp']
}

score_board = {
  player: 0,
  computer: 0
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_COMBINATIONS[first].include?(second)
end

def update_score_board(player, computer, score_board)
  if win?(player, computer)
    score_board[:player] += 1
  elsif win?(computer, player)
    score_board[:computer] += 1
  end
end

def reset_score_board(score_board)
  score_board[:computer] = 0
  score_board[:player] = 0
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    "It's a tie!"
  end
end

loop do
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    prompt(display_results(choice, computer_choice))

    update_score_board(choice, computer_choice, score_board)

    if score_board[:player] == 5
      prompt("Congratulations! You are the grand winner of 5 rounds!")
      reset_score_board(score_board)
      break
    elsif score_board[:computer] == 5
      prompt("Congrautlations! Computer is the grand winner of 5 rounds!")
      reset_score_board(score_board)
      break
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
