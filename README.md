Welcome to Iterable Event Management application. This application facilitates:
1. the integration of iterable third party API
2. creation of events on both the application level and iterable platform
3. creation of users on both the appication level and iterable platform
4. to search through the event names

Application stack:
- Ruby version: 3.0.1
- Rails Version: 7.1.3
- Databse: postgresql

To configure the application locally:
- make sure the you have the specified ruby and rails version in your local
- for database, the application require postgresql DB
- run `bundle install` to install all the ruby gems required for the application
- run `rails db:create` to create the DB
- run `rails db:migrate` to migrate the changes to the new DB
- run `rails db:seed` to populate testing data into the DB

To run the test suites:
- `rspec ./spec/path/to/file`
