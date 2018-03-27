# bank_tech_test

## How to install:

* requires ruby installation (v2.5.0)
* git clone repository
* 'bundle install' dependencies in the terminal

## How to run tests:
* to run tests: 'rspec' in the terminal

## How to use file:
* open irb by running 'irb' in terminal
* create a new bank account with Transactions.new. You can then:
 * deposit money with 'deposit(amount,date)'
 * withdraw money with 'withdraw(amount,date)'
* to read your statement, use account_name.statement_printer

* Notes:
 * Please provide date in 'dd/mm/yyyy' format
 * If you do not provide a date, it will default to today's date
 * Please provide an integer (e.g. 5) or float (5.00) for the amount of transactions

My approach
---------
* I started by breaking down the user specification into user stories (See below)
* I then used TDD to work feature by feature. I aimed to get the test to pass first, then refactored the code
* Based on what I discovered as I went, I added new user features to the README to incorporate
* I also aimed to cover what I saw as a sensible amount of validations, where people might write typos or for example use US rather than UK date format
* I used simplecov to ensure I had full test coverage throughout the development process
* I then did a wider refactor of the code base, and tied together the classes in a separate and clear user interface, with a set of public methods for the user to use
* I then also reviewed the code to ensure I had applied SOLID principles throughout the code base

Personal code review
---------
* I think my algorithmic and TDD led approach enabled me to take each step clearly, quickly and accurately
* I was pleased with my application of OOP and SOLID principles on the whole, particularly single responsibility for methods.
* Being not used to creating applications designed to work with irb, there was some difficulty in getting things to cleanly print to the terminal, and testing this without long text strings
* I was pleased with the structure of my code. Potentially I could have further extracted coding logic into additional classes such as a calculator class for numbers, and/or a validation class for validations of numbers and dates

Next steps I would take with more time
---------
* I would further refactor the code and further apply SOLID principles by extracting logic into additional classes
* I would improve the format of the printed statement using ljust and rjust ruby functions
* I would cover more potential validations and areas of user error
* I would build out a true user interface for the bank account, rather than having it run through the terminal
* I could add additional functionality such as a user being able to have several accounts that talked to each other and could have money transferred between them, or even earn interest

## User stories:

#### CORE FUNCTIONALITY:

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

#### PRINTING

[R] As a User -
So that I can see the transaction history of my bank account -
I want to be able to view a printed history of the use of my bank account

#### VALIDATIONS

[R] As a User -
So that I cannot deposit a negative amount -
I want an error to be raised if I try to deposit a negative amount

[R] As a User -
So that I cannot withdraw a negative amount -
I want an error to be raised if I try to withdraw a negative amount

[R] As a User -
So that I cannot go into my overdraft -
I want an error to be raised if I try to go below a 0 balance

[R] As a User -
So that I cannot break my bank account -
I want an error to be raised if I try to enter something that is not a number (format either 500 or 500.00)

[R] As a User -
So that I cannot break my bank account -
I want an error to be raised if I try to enter an incorrect date of transaction
