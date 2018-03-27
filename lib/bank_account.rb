require_relative 'transactions'

class BankAccount

  attr_reader :transactions

  def initialize
    @transactions = Transactions.new
  end

  def deposit(amount, date = date_today)
    transactions.deposit(amount, date)
    puts "Deposit of #{amount} accepted"
  end

end
