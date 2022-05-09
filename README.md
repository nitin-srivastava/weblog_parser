# Weblog Parser
## About
This Weblog Parser app is a Ruby program that parse a webserver log file and returns the result of total and unique views.

## Instructions to install and run
### Required Ruby and bundler versions
#### Ruby
This app has been developed in ruby version `3.0.0`

#### Bundler
You must have bundler version `2.2.3`. Run the below command to install it.
```
$ gem install bundler:2.2.3
```

#### Run
Go to the project directory and run

```
$ ruby weblog_parser.rb webserver.log
```

#### Run Test
Go to the project directory and run

```
$ bundle exec rspec
```

#### Run Rubocop
Go to the project directory and run

```
$ bundle exec rubocop
```

## Tools
I used below tools to help with development
- **Rspec**: for integration and unit test.
- **Rubocop**: to help with the syntax according to the ruby style guide.
- **Simplecov**: for test coverage.