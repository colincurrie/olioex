# Olio EX Ruby-On-Rails Coding Task
## Colin Currie

This README documents the Ruby-On-Rails coding task completed by [Colin](mailto:colin_currie@hotmail.com) to demonstrate full-stack experience in building a simple website. The original task requirements can be found on the [Olio Ex](https://tech.olioex.com/rails-coding-task.html) website. This guide will explain how to start up the app in a local development environment. It will also describe some of the design considerations employed and hopefully give the reader a good understanding of the code and how to navigate it.

## Project details:

### Ruby version:
* `ruby-3.1.2`

### System dependencies
* Rails 7.0.4
* RSpec 3.12
* SQLite 3.32.3
* Dotenv 2.8.1

### Configuration

Configuration items should be specified in ENV using a `.env` file, specifying the following variables

|Variable|Description|Example|

### Database Set Up

This simple Rails app uses SQLite which requires very little setup, it is run locally saving records to a file called `db/development.sqlite3`. In order to set up the database with the required models and seed data use the following command:

    rails db:setup

### How to run the test suite

The project has an RSpec test suite which generates a code coverage report in the `spec/coverage` folder. The test suite can be run with the following command:

    rspec -f d spec

