def prompt(message)
  puts "=> #{message}"
end

def valid_loan_amount?(loan_amount)
  !loan_amount.empty? &&
    float?(loan_amount) || integer?(loan_amount) &&
      loan_amount.to_f > 0
end

def valid_apr?(apr)
  !apr.empty? && (float?(apr) || integer?(apr)) && apr.to_f > 0
end

def valid_years?(years)
  !years.empty? && integer?(years) && years.to_i > 0
end

def integer?(num)
  num.match?(/^\d+$/)
end

def float?(num)
  num.match?(/^\d+\.?\d+$/)
end

def calculate_monthly_interest_rate(apr)
  apr_percentage = apr.to_f / 100
  monthly_interest_rate = (apr_percentage / 12).round(4)
  monthly_interest_rate
end

def calculate_monthly_payment(
  loan_amount,
  monthly_interest_rate,
  months
)
  monthly_payment =
    loan_amount.to_f.round(2) *
    (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-months))

  monthly_payment.round(2)
end

prompt("Welcome to the Mortgage Calculator!
To calculate your monthly mortgage payment,
we will need your loan amount, annual percentage rate and loan duration.")

loop do
  loan_amount = ''
  loop do
    prompt("What is your loan amount (Example: 10000, 10000.25)?")
    loan_amount = gets.chomp

    break if valid_loan_amount?(loan_amount)
    prompt("Make sure you use a valid number. (Example: 10000, 10000.25)")
  end

  apr = ''
  loop do
    prompt("What is your Annual Percent Rate (APR)
    (Example: enter 1 for 1%, enter 2.5 for 2.5%)?")
    apr = gets.chomp

    break if valid_apr?(apr)
    prompt("Make sure you use a valid number. (Example: 1, 2.5, 3.0)")
  end

  years = ''
  loop do
    prompt("What is your loan duration in years? (Example: 1, 2, 3)")
    years = gets.chomp

    break if valid_years?(years)
    prompt("Make sure you enter a valid amount of years")
  end

  months = years.to_i * 12
  monthly_interest_rate = calculate_monthly_interest_rate(apr)
  monthly_payment = calculate_monthly_payment(
    loan_amount,
    monthly_interest_rate,
    months
  )

  prompt("Your monthly payment is $ #{monthly_payment}")
  prompt("Do you want to to do another calculation?
  Enter Y/y for another calculation. Enter anything else to exit.")
  answer = gets.chomp

  break unless answer.downcase() == ('y')
end

prompt("Thank you for using the Mortgage Calculator! Goodbye!")
