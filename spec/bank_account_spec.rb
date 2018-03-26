require 'bank_account'

describe BankAccount do
  describe '#balance' do
    it 'returns a 0 balance for a new bank account' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit(amount, date)' do
    it 'adds 20 to the balance of the bank account' do
      subject.deposit(20)
      expect(subject.balance).to eq(20)
    end
    it 'records debit transactions including date and amount' do
      subject.deposit(20, '15/03/2018')
      expect(subject.transactions.last).to eq([20, '15/03/2018'])
    end
  end

  describe '#withdraw(amount)' do
    it 'takes away 20 from the balance of the bank account' do
      subject.deposit(50)
      subject.withdraw(20)
      expect(subject.balance).to eq(30)
    end
  end
end
