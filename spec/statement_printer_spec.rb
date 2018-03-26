require 'statement_printer'

describe StatementPrinter do
  let(:credit) { [50, "26/03/2018", "credit", 50] }
  let(:debit) { [20, "26/03/2018", "debit", 30] }
  let(:transactions) { [credit, debit]}
  let(:credit_transaction) { [credit]}
  let(:debit_transaction) { [debit]}


  describe '#print_transactions' do
    it 'prints out a credit transaction' do
      expect { subject.print_transactions(credit_transaction) }.to output("Date || Credit || Debit || Balance\n26/03/2018 || 50.00 ||  || 50.00\n").to_stdout
    end

    it 'prints out a debit transaction' do
      expect { subject.print_transactions(debit_transaction) }.to output("Date || Credit || Debit || Balance\n26/03/2018 ||  || 20.00 || 30.00\n").to_stdout
    end
  end

    it 'prints out a debit AND credit transaction' do
      expect { subject.print_transactions(transactions) }.to output("Date || Credit || Debit || Balance\n26/03/2018 || 50.00 ||  || 50.00\n26/03/2018 ||  || 20.00 || 30.00\n").to_stdout
  end
end
