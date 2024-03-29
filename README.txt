Ruby Developer Test
Before you start coding (and let’s be honest, we know that’s what you want to do), please read
the following.
Firstly, the test should take you no more than 2.5 hours to complete.
Secondly, the test is for us to see how you code and the methodologies you use, what we will be
looking for in this test are the following:
● Functionality
● Efficiency – We like clean, simple code.
● Readability
● Tests (we have 96% test coverage in our code and we aim to keep it that way).
● Also, we would like to understand your ability to use TDD and OO, so please ensure
these are part of your complete test.
● Feel free to submit your solution as a link to your version control repository

1. Ruby Log Parser

Write a ruby script that:

a. Receives a log as argument - webserver.log is provided
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > List of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > List of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...

