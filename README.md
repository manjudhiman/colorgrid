# ColorGrid

ColorGrid is a small application which provide the user accessiblity of selecting the color and fill the grid(20X20) of their choice.
Things you may want to cover:

* Ruby version - ruby-2.4.3
* Rails version - 5.2.1

## Geting Started

  1. Clone the repository
  2. Download [postgresql](https://www.postgresql.org/download/) if not already present.
  3. Install bundler
      ```
        gem install bundler
      ```
  4. Install Gems
     ```
        bundle install
     ```
  5. In order to run locally, migrate the database
     ```
        rails db:create db:migrate RAILS_ENV=<development, test>
     ```
  6. Start the server
     ```
       rails s
     ```
      hit http://localhost:3000

  7. To test the test cases run:
     ```
       rspec
     ```