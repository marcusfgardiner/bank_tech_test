class StatementPrinter
  def print_transaction(transaction)
    print transaction[1] + ' || ' + two_decimals(transaction[0])
  end

  private

  def two_decimals(number)
    ("%0.02f" % number.to_f.to_s)
  end

end
