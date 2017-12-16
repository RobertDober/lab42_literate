Feature: No Doctest
  As RSpec extension developper I want to run rspec on a given spec file
  And see the correct output so that I can check that my extension does
  not interfere with RSpec's normal operation.

  Scenario: One Example No Failures, No Errors
    Given the spec_file named "regression/one_exa_no_failures_no_errs"
    When I run it
    Then I can see that all went alright!
