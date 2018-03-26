class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    update_balance(amount)
    add_transaction(amount, date)
  end

  def withdraw(amount, date)
    update_balance(-amount)
    add_transaction(amount, date)
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def add_transaction(amount, date)
    @transactions << [amount, date]
  end
end
