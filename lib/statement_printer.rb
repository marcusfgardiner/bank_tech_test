class StatementPrinter
  def print_transaction(transaction)
    print transaction[1] + ' || ' + ("%0.02f" % transaction[0].to_f.to_s)
  end

end
