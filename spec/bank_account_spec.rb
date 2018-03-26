require 'bank_account'

describe BankAccount do
  let(:bank_deposit_50) do
    subject.deposit(50, '12/03/2018')
    subject
  end

  let(:bank_deposit_50_withdraw_20) do
    bank_deposit.withdraw(20, '15/03/2018')
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
    it 'records a debit transaction including date and amount' do
      expect(bank_deposit_50.transactions.last).to eq([20, '15/03/2018'])
    end

    it 'records a credit transaction including date and amount' do
      expect(bank_deposit_50_withdraw_20.transactions.last).to eq([20, '15/03/2018'])
    end
  end

end
