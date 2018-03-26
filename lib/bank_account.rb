require 'date'

class BankAccount
  attr_reader :balance, :transactions

  ERRORS = {
    number_format: 'Please provide an integer or number to 2 decimal places',
    positive_number: 'Please provide a positive amount',
    date_format: "Not a correct date. Please provide date in format 'dd/mm/yy'",
    min_balance: 'Withdrawal denied, balance would go below 0!'
  }.freeze

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date = date_today)
    validations(amount, date)
    update_balance(amount)
    add_transaction(amount, date, 'credit')
  end

  def withdraw(amount, date = date_today)
    validations(amount, date)
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

  def validations(amount, date)
    unless (amount.is_a? Integer) || (amount.is_a? Float)
      raise ERRORS[:number_format]
    end
    raise ERRORS[:positive_number] if amount < 0
    begin
      uk_date_format_check(date)
    rescue ArgumentError
      raise ERRORS[:date_format]
    end
  end

  def uk_date_format_check(date)
    date = Date.strptime(date, '%d/%m/%Y').to_s
    Date.parse(date)
  end

  def min_balance(amount)
    raise ERRORS[:min_balance] if amount > balance
  end
end
