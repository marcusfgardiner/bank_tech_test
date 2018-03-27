require 'bank_account'

describe 'Feature test: user can perform transactions and print statement' do
  it 'prints statement correctly after 2 deposits and 2 withdrawals' do
    acc = BankAccount.new
    acc.deposit(30, '11/02/2012')
    acc.withdraw(10, '11/02/2012')
    acc.deposit(50.00, '12/02/2012')
    acc.withdraw(45.50, '12/02/2012')
    expect { acc.print_statement }.to output("Date || Credit || Debit || Balance\n11/02/2012 || 30.00 ||  || 30.00\n11/02/2012 ||  || 10.00 || 20.00\n12/02/2012 || 50.00 ||  || 70.00\n12/02/2012 ||  || 45.50 || 24.50\n").to_stdout
  end
end
