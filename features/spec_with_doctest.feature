Feature: Doctest
  As RSpec extension developper I want to run rspec on a given spec file wich calls doctest
  And see the correct output so that I can check that my extension does execute the doctest
  part correctly.

  Scenario: Doctest does not find any `literate` block
    Given the spec_file named "doctest_no_literate_block"
    When I run it
    Then no specs were run

  Scenario: Doctest runs a `literate` block successfully
    Given the spec_file named "doctest_successful_literal_block"
    When I run it
    Then it executes 2 examples
    And I can see that all went alright!

  Scenario: Doctest with `literate` blocks, successful or not
    Given the spec_file named "doctest_mixed"
    When I run it
    Then it executes 4 examples
    And I can see "3 \s failures"

  Scenario: Doctest with an explicit title
    Given the spec_file named "doctest_with_title"
    When I run it with option "-f doc"
    Then I can see that all went alright!
    And the output contains "explicit example title" 


  Scenario: Doctest with setup
    Given the spec_file named "doctest_with_setup"
    When I run it
    Then it executes 1 example
    And I can see that all went alright!

