Feature: Doctest With Given
  As RSpec extension developper I want to run rspec on a given spec file wich calls doctest
  for a literal file that has a Given section.
  And see the correct output so that I can check that my extension does execute the doctest
  part correctly.

  Scenario: Doctest With A Given Section
    Given the spec_file named "doctest_with_given"
    When I run it
    Then it executes 1 example
    And I can see that all went alright!
