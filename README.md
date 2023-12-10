# README

## Background
Silvercat have decided to open an online bank, Catbank, using our new currency, Silveuros.
The new bank will run a promotion giving all new customers 100 free Silveuros when they
sign up.

## Requirements
We would like you to build a prototype web application that allows users to:
- Create an account / log in
- View their current balance and transactions
- Send Silveuros to other users

## Setup:
* install ruby 3.2.2 (I use asdf)
* gem install rails
* bundle install
* rails s
* bundle exec rails db:migrate

## Decisions:
* I chose to use Devise as it is a very quick solution to implement for adding account creation and logins.
* I have assumed CatBank does not provide overdrafts to simplify the problem.
* As everyone starts with 100 Silveuros, I have added this as the DB default.

## Improvents I would make
* Better errors/validation for payments
* Add pagination, sort, search etc to transactions screen
* Styling, especially transaction screen
* Store more user details
* Swap out rails front end 