VALID_CHOICES = ['rock', 'paper', 'scissors']
def test_method
  prompt('test')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# refactor the conditions to smaller helper methods
# one method for the if and another for the elsif
def display_results(player, computer)
  if  (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    "You won!"
  elsif (player == 'rock' && computer == 'paper')     ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    "Computer won!"
  else
    "It's a tie!"
  end
end

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

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
