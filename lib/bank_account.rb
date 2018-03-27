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

  def withdraw(amount, date = date_today)
    transactions.withdraw(amount, date)
    puts "Withdrawal of #{amount} accepted"
  end

  def print_statement
    transactions.print_statement
  end

  private

  def date_today
    Time.now.strftime('%d/%m/%Y')
  end

end
