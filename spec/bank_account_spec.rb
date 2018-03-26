require 'bank_account'

describe BankAccount do
  let(:bank_deposit_50) do
    subject.deposit(50, '12/03/2018')
    subject
  end

  let(:bank_deposit_50_withdraw_20) do
    bank_deposit_50.withdraw(20, '15/03/2018')
    bank_deposit_50
  end

  let(:date_today) do
    Time.now.strftime('%d/%m/%Y')
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

    it 'record todays date if no date is provided for a debit transaction' do
      subject.deposit(50)
      expect(subject.transactions.last[1]).to eq(date_today)
    end
  end

  describe '#withdraw(amount, date)' do
    it 'takes away 20 from the balance of the bank account' do
      expect(bank_deposit_50_withdraw_20.balance).to eq(30)
    end

    it 'record todays date if no date is provided for a debit transaction' do
      bank_deposit_50.withdraw(30)
      expect(bank_deposit_50.transactions.last[1]).to eq(date_today)
    end

    it 'raises an error if balance would go below 0 from withdrawal' do
      expect { subject.withdraw(20) }.to raise_error('Withdrawal denied, balance would go below 0!')
    end
  end

  describe '#validations' do
    it 'raises an error if a negative amount is provided for a deposit' do
      expect { subject.deposit(-10) }.to raise_error('Please provide a positive amount')
    end

    it 'raises an error if a negative amount is provided for a withdrawal' do
      expect { bank_deposit_50.withdraw(-10) }.to raise_error('Please provide a positive amount')
    end

    it 'raises an error if amount is not an integer' do
      expect { subject.deposit('hello') }.to raise_error('Please provide an integer or number to 2 decimal places')
    end

    it 'not raise an error if amount is a float with 2 dp' do
      expect { subject.deposit(50.00) }.not_to raise_error
    end

    it 'raises an error if date provided is not of correct format' do
      expect { subject.deposit(50, 'hello') }.to raise_error("Not a correct date. Please provide date in format 'dd/mm/yy'")
    end

    it 'raises an error if date provided is not a valid UK date' do
      expect { subject.deposit(50, '5/25/2012') }.to raise_error("Not a correct date. Please provide date in format 'dd/mm/yy'")
    end

    it 'does not raise an error if date provided is a valid UK date' do
      expect { subject.deposit(50, '25/05/2012') }.not_to raise_error
    end
  end

  describe '#transactions' do
    it 'records a debit transaction including date, amount and type' do
      expect(bank_deposit_50.transactions.last).to eq([50, '12/03/2018', 'credit'])
    end
    it 'records a credit transaction including date, amount and type' do
      expect(bank_deposit_50_withdraw_20.transactions.last).to eq([20, '15/03/2018', 'debit'])
    end
  end
end
