require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(10)
  end

  def test_accept_money
    transaction = Transaction.new(1)
    transaction.amount_paid = 1 

    previous_amount = @cash_register.total_money
    @cash_register.accept_money(transaction)
    current_amount = @cash_register.total_money

    assert_equal(previous_amount + 1, current_amount)
  end

  def test_change
    transaction = Transaction.new(1)
    transaction.amount_paid = 5
    expected_change = @cash_register.change(transaction)

    assert_equal(4, @cash_register.change(transaction))
  end

  def test_give_receipt
    transaction = Transaction.new(1)
    output = "You've paid $1.\n"

    assert_output(output) do
      @cash_register.give_receipt(transaction)
    end
  end
  
  def test_prompt_for_payment
    transaction = Transaction.new(1)
    output1 = "You owe $1.\nHow much are you paying?\n"

    $stdin = StringIO.new('5')
    assert_output(output1) do
      transaction.prompt_for_payment
    end
  end

end
