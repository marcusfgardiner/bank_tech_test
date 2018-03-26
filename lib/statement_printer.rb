class StatementPrinter
  def print_transaction(transaction)
    if transaction_type(transaction) == 'credit'
      print transaction[1] + ' || ' + two_decimals(transaction[0])  + ' ||  || ' +  two_decimals(transaction[3])
    else
      print transaction[1] + ' ||  || ' + two_decimals(transaction[0]) +  ' || ' + two_decimals(transaction[3])
    end
  end

  private

  def transaction_type(transaction)
    transaction[2]
  end

  def two_decimals(number)
    ("%0.02f" % number.to_f.to_s)
  end

end
