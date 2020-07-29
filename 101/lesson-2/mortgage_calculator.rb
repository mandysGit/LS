def prompt(message)
  puts "=> #{message}"
end

def valid_loan_amount?(loan_amount)
  integer?(loan_amount) && loan_amount.to_i > 0
end

def valid_apr?(apr)
  (float?(apr) || integer?(apr)) && apr.to_f > 0
end

def valid_years?(years)
  integer?(years) && years.to_i > 0
end

def integer?(num)
  num.match?(/^\d+$/)
end

def float?(num)
  num.match?(/^\d+\.?\d+$/)
end

def calculate_monthly_interest_rate(apr)
  apr_percentage = apr.to_f / 100
  monthly_interest_rate = (apr_percentage / 12)
  monthly_interest_rate
end

def calculate_monthly_payment(
  loan_amount,
  monthly_interest_rate,
  months
)
  monthly_payment =
    loan_amount.to_f *
    (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-months))

  monthly_payment.round(2)
end

def display_welcome
  "Welcome to the Mortgage Calculator!
   To calculate your monthly mortgage payment,
   we will need your loan amount, annual percentage rate and loan duration."
end

def display_monthly_payment(monthly_payment)
  "Your monthly payment is $ #{monthly_payment}"
end

def display_new_calculation
  "Do you want to do another calculation?
   Enter Y/y for another calculation. Enter anything else to exit."
end

def display_thank_you
  "Thank you for using the Mortgage Calculator! Goodbye!"
end

def display_loan_amount
  "What is your loan amount (Example: 10000)?"
end

def display_invalid_loan(loan_amount)
  "#{loan_amount} is invalid.
   Only positive whole numbers are accepted."
end

def display_apr
  "What is your Annual Percent Rate (APR)
   (Example: enter 1 for 1%, enter 2.5 for 2.5%)?"
end

def display_invalid_apr(apr)
  "#{apr} is invalid.
   Only positive whole numbers or positive decimal numbers are accepted."
end

def display_year
  "What is your loan duration in years? (Example: 1, 2, 3)"
end

def display_invalid_year(years)
  "#{years} is invalid.
   Only positive whole numbers are accepted."
end

def retrieve_loan_amount
  loan_amount = ''
  loop do
    prompt(display_loan_amount)
    loan_amount = gets.chomp

    break if valid_loan_amount?(loan_amount)
    prompt(display_invalid_loan(loan_amount))
  end

  loan_amount
end

def retrieve_apr
  apr = ''
  loop do
    prompt(display_apr)
    apr = gets.chomp

    break if valid_apr?(apr)
    prompt(display_invalid_apr(apr))
  end

  apr
end

def retrieve_duration
  years = ''
  loop do
    prompt(display_year)
    years = gets.chomp

    break if valid_years?(years)
    prompt(display_invalid_year(years))
  end

  years
end

prompt(display_welcome)

loop do
  loan_amount = retrieve_loan_amount
  apr = retrieve_apr
  years = retrieve_duration

  months = years.to_i * 12
  monthly_interest_rate = calculate_monthly_interest_rate(apr)
  monthly_payment = calculate_monthly_payment(
    loan_amount,
    monthly_interest_rate,
    months
  )

  prompt(display_monthly_payment(monthly_payment))
  prompt(display_new_calculation)
  answer = gets.chomp

  break unless answer.downcase() == ('y')
end

prompt(display_thank_you)
