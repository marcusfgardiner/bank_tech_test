class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date = date_today)
    validations(amount)
    update_balance(amount)
    add_transaction(amount, date, 'credit')
  end

  def withdraw(amount, date = date_today)
    validations(amount)
    min_balance(amount)
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

  def validations(amount)
    raise 'Please provide a positive amount' if amount < 0
  end

  def min_balance(amount)
    raise 'Withdrawal denied, balance would go below 0!' if amount > balance
  end
end
