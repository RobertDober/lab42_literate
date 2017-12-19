
# Lab42::Literate

[![Gem Version](https://badge.fury.io/rb/lab42_literate.svg)](http://badge.fury.io/rb/lab42_literate)
[![Build Status](https://travis-ci.org/RobertDober/lab42_literate.svg?branch=master)](https://travis-ci.org/RobertDober/lab42_literate)
[![Code Climate](https://codeclimate.com/github/RobertDober/lab42_literate/badges/gpa.svg)](https://codeclimate.com/github/RobertDober/lab42_literate)
[![Issue Count](https://codeclimate.com/github/RobertDober/lab42_literate/badges/issue_count.svg)](https://codeclimate.com/github/RobertDober/lab42_literate)
[![Test Coverage](https://codeclimate.com/github/RobertDober/lab42_literate/badges/coverage.svg)](https://codeclimate.com/github/RobertDober/lab42_literate)

## Literate Programming à la doctest.

Just extract code blocks from any file, and run them as specs with a simple `doctest file` in an RSpec example group.

### Installation

      gem install lab42_literate

or in Gemfile

      gem 'lab42_literate'

Then in your `spec_helper`

      require 'lab42/literate'

which makes the `doctest` method available in all example groupes of type `literate`.

### Very Quick Start

You can write RSpec example code inside a ` ```ruby literate ` block.

        ```ruby literate
          expect(%w{a b c}).not_to be_empty
        ```

There is an easy way to express `expect(...).to eq(...)` with the following special form...

        ```ruby literate
          1 + 41 #=> 42
        ```

Then, assuming the above text being inside a file `some_literate.md` one can execute the two examples above
with

        RSpec.describe 'example', type: :literate do
          doctest 'some_literate.md'
        end


### How does it work?

Each block ` ```ruby literate`  creates an example with title `"literate block in #{file}:#{start_lnb}..#{end_lnb}"`
and instance_evals the lines from the block in the example's context.


### Setup?

Not yet.

### Explicit Title of the generated example

Just add text  after ` ```ruby literate`
