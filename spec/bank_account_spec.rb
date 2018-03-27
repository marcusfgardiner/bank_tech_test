require 'bank_account'

describe BankAccount do

  it 'sends a payment confirmation text message' do
    expect(subject.transactions).to receive(:deposit).with(50, '12/12/2012')
    subject.deposit(50, '12/12/2012')
  end

  it 'puts to the screen that deposit was succesful' do
    expect { subject.deposit(50,'12/12/2012') }.to output("Deposit of 50 accepted\n").to_stdout
  end

  # it 'returns a string showing the deposit has happened' do
  #
  # end

end
