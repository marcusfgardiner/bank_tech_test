class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date = date_today)
    raise 'Please provide a positive amount' if amount < 0
    update_balance(amount)
    add_transaction(amount, date, 'credit')
  end

  def withdraw(amount, date = date_today)
    raise 'Please provide a positive amount' if amount < 0
    update_balance(-amount)
    add_transaction(amount, date, 'debit')
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def add_transaction(amount, date, type)
    @transactions << [amount, date, type]
  end

  def date_today
    Time.now.strftime('%d/%m/%Y')
  end
end
