require 'date'
require_relative 'statement_printer'

class Transactions
  attr_reader :balance, :transactions, :statement_printer

  ERRORS = {
    number_format: 'Please provide an integer or number to 2 decimal places',
    positive_number: 'Please provide a positive amount',
    date_format: "Not a correct date. Please provide date in format 'dd/mm/yy'",
    min_balance: 'Withdrawal denied, balance would go below 0!'
  }.freeze

  def initialize
    @balance = 0
    @transactions = []
    @statement_printer = StatementPrinter.new
  end

  def deposit(amount, date = date_today)
    validations(amount, date)
    update_balance(amount)
    add_transaction(amount, date, 'credit')
  end

  def withdraw(amount, date = date_today)
    validations(amount, date)
    min_balance_check(amount)
    update_balance(-amount)
    add_transaction(amount, date, 'debit')
  end

  def print_statement
    statement_printer.print_transactions(transactions)
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def add_transaction(amount, date, type)
    @transactions << [amount, date, type, balance]
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

  def min_balance_check(amount)
    raise ERRORS[:min_balance] if amount > balance
  end
end
