# bank_tech_test

## How to use:

* git clone repository
* 'bundle install' dependencies in the terminal
* to run tests: 'rspec' in the terminal

## User stories:

[R] As a User -
So that I can see the balance of my bank account -
I want to be able to check the balance of my bank account

[R] As a User -
So that I can have a bank account -
I want to be able to create a bank account with a default balance of 0

[R] As a User -
So that I can increase the balance of my bank account -
I want to be able to deposit money into my bank account

[R] As a User -
So that I can decrease the balance of my bank account -
I want to be able to withdraw money from my bank account

[R] As a User -
So that I can see when I debited money from my bank account -
I want the bank account to record the dates and amounts of debit transactions to my bank account

[R] As a User -
So that I can see when I credited money to my bank account -
II want the bank account to record the dates and amounts of credit transactions to my bank account

[R] As a User -
So that I can see when I credited versus debited money to my bank account -
I want the bank account to record the type of transactions to my bank account

[R] As a User -
So that I can see when I withdrew money into my bank account -
If I don't provide a date, I want the default date for when I withdrew money to be today

[R] As a User -
So that I can see when I deposited money into my bank account -
If I don't provide a date, I want the default date for when I deposit money to be today

# PRINTING

As a User -
So that I can see the transaction history of my bank account -
I want to be able to view a printed history of the use of my bank account

# VALIDATIONS

[R] As a User -
So that I cannot deposit a negative amount -
I want an error to be raised if I try to deposit a negative amount

[R] As a User -
So that I cannot withdraw a negative amount -
I want an error to be raised if I try to withdraw a negative amount

As a User -
So that I cannot go into my overdraft -
I want an error to be raised if I try to go below a 0 balance

As a User -
So that I cannot break my bank account -
I want an error to be raised if I try to enter something that is not a number (format either 500 or 500.00)

As a User -
So that I cannot break my bank account -
I want an error to be raised if I try to enter an incorrect date of transaction

As a User -
So that I cannot break my bank account -
I want an error to be raised if I try to enter a date of transaction in the future
