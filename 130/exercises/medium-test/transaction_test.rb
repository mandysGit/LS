require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment_output
    transaction = Transaction.new(1)
    input = StringIO.new('5\n')

    assert_output("You owe $1.\nHow much are you paying?\n") do
      transaction.prompt_for_payment(input: input)
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(1)
    input = StringIO.new('5\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal(5, transaction.amount_paid)
  end
end
