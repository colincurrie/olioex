# Olio EX Ruby-On-Rails Coding Task
## Colin Currie

This README documents the Ruby-On-Rails coding task completed by [Colin](mailto:colin_currie@hotmail.com) to demonstrate full-stack experience in building a simple website. The original task requirements can be found on the [Olio Ex](https://tech.olioex.com/rails-coding-task.html) website. This guide will explain how to start up the app in a local development environment. It will also describe some of the design considerations employed and hopefully give the reader a good understanding of the code and how to navigate it.

## Project details:

### Ruby version:
* ruby 3.1.2

### System dependencies
* Rails 7.0.4
* RSpec 3.12
* pg 1.4.5 (PostgreSQL 15.1)
* Dotenv 2.8.1

### Configuration

Configuration items should be specified in ENV using a `.env` file, specifying the following variables

| Variable | Description | Example |
|----------|-------------|---------|


### Database Set Up

This rails app uses a PostreSQL database which will need to be set up before running the app or the test suite. If you do not have PostgreSQL installed this can be done simply with the following commands:

On a Mac:

    brew install postgresql

On Windows use [this PostgreSQL installer](https://www.postgresql.org/download/windows/)

And setting up the database can be done by running the following commands:

    rails db:create
    rails db:migrate

### How to run the test suite

The project has an RSpec test suite which generates a code coverage report in the `spec/coverage` folder. The test suite can be run with the following command:

    rspec -f d spec

