Feature: Doctest
  As RSpec extension developper I want to run rspec on a given spec file wich calls doctest
  and other specs.
  And see the correct output so that I can check that my extension does execute the doctest
  part correctly.

  Scenario: Doctest and other specs
    Given the spec_file named "doctest_and_specs"
    When I run it
    Then it executes 5 examples
    And I can see "2 \s failures"
    And the output contains "expected `43.zero?` to return true, got false"
    And the output matches "expected: \s+ true \s+ got: \s+ nil"
