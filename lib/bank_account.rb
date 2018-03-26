class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    @transactions << [amount, date]
  end

  def withdraw(amount, date)
    @balance -= amount
    @transactions << [amount, date]
  end
end
