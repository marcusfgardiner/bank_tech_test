require 'bank_account'

describe BankAccount do
  describe '#balance' do
    it 'returns a 0 balance for a new bank account' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit(amount)' do
    it 'adds 20 to the balance of the bank account' do
      subject.deposit(20)
      expect(subject.balance).to eq(20)
    end
  end
end
