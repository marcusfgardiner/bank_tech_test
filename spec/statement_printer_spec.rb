require 'statement_printer'

describe StatementPrinter do
  let(:credit) { [50, "26/03/2018", "credit"] }
  describe '#print_transaction' do
    it 'prints out a credit transaction' do
      expect { subject.print_transaction(credit) }.to output("26/03/2018 || 50.00").to_stdout
    end

    it 'prints out a credit transaction' do
      expect { subject.print_transaction(credit) }.to output("26/03/2018 || 50.00").to_stdout
    end
  end
end
