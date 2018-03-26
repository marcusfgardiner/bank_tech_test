# bank_tech_test

## User stories:

[G] As a User -
So that I can see the balance of my bank account -
I want to be able to check the balance of my bank account

[G] As a User -
So that I can have a bank account -
I want to be able to create a bank account with a default balance of 0

As a User -
So that I can increase the balance of my bank account -
I want to be able to deposit money into my bank account

As a User -
So that I can see when I deposited money into my bank account -
I want to be able to provide a date that I deposited money

As a User -
So that I can decrease the balance of my bank account -
I want to be able to withdraw money from my bank account

As a User -
So that I can see when I withdrew money into my bank account -
I want to be able to provide a date that I withdrew money

# PRINTING

As a User -
So that I can see the transaction history of my bank account -
I want to be able to view a printed history of the use of my bank account

# VALIDATIONS

As a User -
So that I cannot deposit a negative amount -
I want an error to be raised if I try to deposit a negative amount

As a User -
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
