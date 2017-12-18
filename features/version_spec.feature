Feature: Version Spec
  As the RSpec plugin developper I want to run specs for test coverage too.

  Scenario: Version Spec
    Given the spec_file named "version"
    When I run it
    Then I can see that all went alright!
