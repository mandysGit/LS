def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to the mortgage calculator!")

loop do
  def valid_loan_amount?(loan_amount)
    !loan_amount.empty? &&
      (float?(loan_amount) || integer?(loan_amount)) &&
      loan_amount.to_f > 0
  end

  def valid_apr?(apr)
    !apr.empty? && (float?(apr) || integer?(apr)) && apr.to_f > 0
  end

  def valid_loan_duration_years?(years)
    !years.empty? && integer?(years) && years.to_i > 0
  end

  def integer?(num)
    num.match?(/^\d+$/)
  end

  def float?(num)
    num.match?(/^\d+\.?\d+$/)
  end

  loan_amount = ''
  loop do
    prompt("What is your loan amount ($)?")
    loan_amount = gets.chomp

    if valid_loan_amount?(loan_amount)
      break
    else
      prompt("Make sure you use a valid number")
    end
  end

  apr = ''
  loop do
    prompt("What is your Annual Percent Rate (APR) (Example: 2.5 for 2.5%)?")
    apr = gets.chomp

    if valid_apr?(apr)
      break
    else
      prompt("Make sure you use a valid number")
    end
  end

  loan_duration_years = ''
  loop do
    prompt("What is your loan duration in years?")
    loan_duration_years = gets.chomp

    if valid_loan_duration_years?(loan_duration_years)
      break
    else
      prompt("Make sure you enter a valid amount of years")
    end
  end

  def calculate_monthly_interest_rate(apr)
    apr_percentage = apr.to_f / 100
    monthly_interest_rate = (apr_percentage / 12).round(4)
    monthly_interest_rate
  end

  def calculate_loan_duration_months(loan_duration_years)
    loan_duration_years.to_i * 12
  end

  def calculate_monthly_payment(
    loan_amount,
    m_interest_rate,
    loan_duration_months
  )
    m_payment =
      loan_amount.to_f.round(2) *
      (m_interest_rate / (1 - (1 + m_interest_rate)**-loan_duration_months))

    m_payment.round(2)
  end

  loan_duration_months = calculate_loan_duration_months(loan_duration_years)
  monthly_interest_rate = calculate_monthly_interest_rate(apr)
  monthly_payment = calculate_monthly_payment(
    loan_amount,
    monthly_interest_rate,
    loan_duration_months
  )

  prompt("Your monthly payment is $ #{monthly_payment}")

  prompt("Another calculation?")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
