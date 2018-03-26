class StatementPrinter
  def print_transaction(transaction)
    if transaction[2] == 'credit'
      print transaction[1] + ' || ' + two_decimals(transaction[0])  + ' ||  || ' +  two_decimals(transaction[3])
    else
      print transaction[1] + ' ||  || ' + two_decimals(transaction[0]) +  ' || ' + two_decimals(transaction[3])
    end
  end

  private

  def two_decimals(number)
    ("%0.02f" % number.to_f.to_s)
  end

end
