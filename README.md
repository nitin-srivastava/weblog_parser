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
$ bundle install
```

#### Run
Go to the project directory and run

```
$ ruby weblog_parser.rb webserver.log
```

#### Run Test (Rspec)
Go to the project directory and run

```
$ bundle exec rspec
```

#### Run Rubocop
Go to the project directory and run

```
$ bundle exec rubocop
```
### Test coverage (Simplecov)
To see the test coverage, please run the above **rspec** from project directory and open the `coverage/index.html` file in browser. I have achieved 100% test coverage (see attached screenshot).
![test_coverage](https://user-images.githubusercontent.com/24418296/167449901-fd9acd07-3002-46fc-ab42-143ea68af1c5.jpg)


## Tools
I used below tools to help with development
- **Rspec**: for integration and unit test.
- **Rubocop**: to help with the syntax according to the ruby style guide.
- **Simplecov**: for test coverage.

## Run aaplication (Input/Output)
Go to the project directory and use below command to run the app.
```
$ ruby weblog_parser.rb webserver.log
```
**Output**
```
Total Visits
==============================
/about/2 90 visits.
/contact 89 visits.
/index 82 visits.
/about 81 visits.
/help_page/1 80 visits.
/home 78 visits.
==============================

Unique Views
==============================
/contact 23 unique views.
/help_page/1 23 unique views.
/home 23 unique views.
/index 23 unique views.
/about/2 22 unique views.
/about 21 unique views.
==============================
```
### Error Handling (Edge cases)
#### 1. When given file doesn't exist.

```
$ ruby weblog_parser.rb test.log
```
**Output**
```
Error:: file doesn't exist.
```

#### 2. When log file is empty.

```
$ ruby weblog_parser.rb spec/fixtures/files/empty_webserver.log
```
**Output**
```
Error:: log file is empty.
```

#### 3. When log file has invalid data format.

```
$ ruby weblog_parser.rb spec/fixtures/files/ivalid_webserver_data.log
```
**Output**
```
Error:: file has invalid data format.
```

#### 4. When log file has invalid file extension (not .log file).

```
$ ruby weblog_parser.rb spec/fixtures/files/ivalid_file_format.txt
```
**Output**
```
Error:: invalid file extension. Only .log file accepted.
```
