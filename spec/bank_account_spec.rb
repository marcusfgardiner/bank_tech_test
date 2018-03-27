require 'bank_account'

describe BankAccount do

  it 'sends a payment confirmation text message' do
    expect(subject.transactions).to receive(:deposit).with(50, '12/12/2012')
    subject.deposit(50, '12/12/2012')
  end

  # it 'returns a string showing the deposit has happened' do
  #
  # end

end
