require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction.amount_paid = 60

    assert_equal(10, register.change(transaction))
  end

  def test_give_receipt
    item_cost = 100
    register = CashRegister.new(1000)
    transaction = Transaction.new(100)
    assert_output("You've paid $#{item_cost}.\n") { register.give_receipt(transaction) }
  end

  def test_for_prompt_payment
    transaction = Transaction.new(100)
    input = StringIO.new('100\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(100, transaction.amount_paid)
  end
end