require 'bank_account'

describe BankAccount do

  it 'deposits money using the transaction class' do
    expect(subject.transactions).to receive(:deposit).with(50, '12/12/2012')
    subject.deposit(50, '12/12/2012')
  end

  it 'puts to the screen that deposit was succesful' do
    expect { subject.deposit(50,'12/12/2012') }.to output("Deposit of 50 accepted\n").to_stdout
  end

  it 'withdraws money using the transaction class' do
    allow(subject.transactions).to receive(:withdraw)
    expect(subject.transactions).to receive(:withdraw).with(50, '12/12/2012')
    subject.withdraw(50, '12/12/2012')
  end

  it 'puts to the screen that withdrawal was succesful' do
    allow(subject.transactions).to receive(:withdraw)
    expect { subject.withdraw(50,'12/12/2012') }.to output("Withdrawal of 50 accepted\n").to_stdout
  end

  # it 'returns a string showing the deposit has happened' do
  #
  # end

end
