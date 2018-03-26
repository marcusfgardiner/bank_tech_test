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
      date_today = Time.now.strftime('%d/%m/%Y')
      expect(subject.transactions.last[1]).to eq(date_today)
    end
  end

  describe '#withdraw(amount, date)' do
    it 'takes away 20 from the balance of the bank account' do
      expect(bank_deposit_50_withdraw_20.balance).to eq(30)
    end

    it 'record todays date if no date is provided for a debit transaction' do
      bank_deposit_50_withdraw_20
      date_today = Time.now.strftime('%d/%m/%Y')
      expect(bank_deposit_50_withdraw_20.transactions.last[1]).to eq(date_today)
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
