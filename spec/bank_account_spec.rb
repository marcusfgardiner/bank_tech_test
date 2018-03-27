require 'bank_account'

describe BankAccount do

  let(:date_today) do
    Time.now.strftime('%d/%m/%Y')
  end

  describe '#deposit' do

    it 'deposits money using the transaction class' do
      expect(subject.transactions).to receive(:deposit).with(50, '12/12/2012')
      subject.deposit(50, '12/12/2012')
    end

    it 'puts to the screen that deposit was succesful' do
      expect { subject.deposit(50,'12/12/2012') }.to output("Deposit of 50 accepted\n").to_stdout
    end

    it 'record todays date if no date is provided for a debit transaction' do
      expect(subject.transactions).to receive(:deposit).with(50, date_today)
      subject.deposit(50)
    end

  end

  describe '#withdraw' do

    it 'withdraws money using the transaction class' do
      allow(subject.transactions).to receive(:withdraw)
      expect(subject.transactions).to receive(:withdraw).with(50, '12/12/2012')
      subject.withdraw(50, '12/12/2012')
    end

    it 'puts to the screen that withdrawal was succesful' do
      allow(subject.transactions).to receive(:withdraw)
      expect { subject.withdraw(50,'12/12/2012') }.to output("Withdrawal of 50 accepted\n").to_stdout
    end

    it 'record todays date if no date is provided for a debit transaction' do
      expect(subject.transactions).to receive(:withdraw).with(50, date_today)
      subject.withdraw(50)
    end

  end

  describe '#print_statement' do

    it 'calls print statement in the transactions class' do
      allow(subject.transactions).to receive(:print_statement)
      expect(subject.transactions).to receive(:print_statement)
      subject.print_statement(50, '12/12/2012')
    end

  end

end
