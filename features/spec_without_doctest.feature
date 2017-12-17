Feature: No Doctest
  As RSpec extension developper I want to run rspec on a given spec file without a doctest
  And see the correct output so that I can check that my extension does
  not interfere with RSpec's normal operation.

  Scenario: No Failures, No Errors
    Given the spec_file named "no_doctest_no_failures_no_errs"
    When I run it
    Then I can see that all went alright!

  Scenario: One Failure, No Errors
    Given the spec_file named "no_doctest_failure_no_errs"
    When I run it
    Then I can see "1 \s failure"

  Scenario: One Failure, One Error
    Given the spec_file named "no_doctest_failure_error"
    When I run it
    Then I can see "2 \s failures"
    And  an error of class "RuntimeError" with a message matching "this is expected" is reported
