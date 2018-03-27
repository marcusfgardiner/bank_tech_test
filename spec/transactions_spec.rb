require 'transactions'

describe Transactions do
  let(:bank_deposit_50) do
    subject.deposit(50, '12/03/2018')
    subject
  end

  let(:bank_deposit_50_withdraw_20) do
    bank_deposit_50.withdraw(20, '15/03/2018')
    bank_deposit_50
  end

  describe '#balance' do
    it 'returns a 0 balance for a new bank account' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit(amount, date)' do
    it 'adds 50 to the balance of the bank account' do
      expect(bank_deposit_50.balance).to eq(50)
    end
  end

  describe '#withdraw(amount, date)' do
    it 'takes away 20 from the balance of the bank account' do
      expect(bank_deposit_50_withdraw_20.balance).to eq(30)
    end
  end

  describe '#transactions' do
    it 'records a debit transaction including date, amount, type and balance' do
      expect(bank_deposit_50.transactions.last).to eq([50, '12/03/2018', 'credit', 50])
    end
    it 'records a credit transaction including date, amount type and balance' do
      expect(bank_deposit_50_withdraw_20.transactions.last).to eq([20, '15/03/2018', 'debit', 30])
    end
  end

  describe '#print_statement' do
    let(:transactions) { [[50, '12/03/2018', 'credit', 50], [20, '15/03/2018', 'debit', 30]] }
    it 'calls prints statement in the statement printer class' do
      allow(bank_deposit_50_withdraw_20.statement_printer).to receive(:print_transactions)
      expect(bank_deposit_50_withdraw_20.statement_printer).to receive(:print_transactions).with(transactions)
      bank_deposit_50_withdraw_20.print_statement
    end
  end

  describe '#validations' do
    let(:errors) { described_class::ERRORS }

    it 'raises an error if balance would go below 0 from withdrawal' do
      expect { subject.withdraw(20, '12/12/2012') }.to raise_error(errors[:min_balance])
    end

    it 'raises an error if a negative amount is provided for a deposit' do
      expect { subject.deposit(-10, '12/12/2012') }.to raise_error(errors[:positive_number])
    end

    it 'raises an error if a negative amount is provided for a withdrawal' do
      expect { bank_deposit_50.withdraw(-10, '12/12/2012') }.to raise_error(errors[:positive_number])
    end

    it 'raises an error if amount is not an integer' do
      expect { subject.deposit('hello', '12/12/2012') }.to raise_error(errors[:number_format])
    end

    it 'not raise an error if amount is a float with 2 dp' do
      expect { subject.deposit(50.00, '12/12/2012') }.not_to raise_error
    end

    it 'raises an error if date provided is not of correct format' do
      expect { subject.deposit(50, 'hello') }.to raise_error(errors[:date_format])
    end

    it 'raises an error if date provided is not a valid UK date' do
      expect { subject.deposit(50, '5/25/2012') }.to raise_error(errors[:date_format])
    end

    it 'does not raise an error if date provided is a valid UK date' do
      expect { subject.deposit(50, '25/05/2012') }.not_to raise_error
    end
  end
end
