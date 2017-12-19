
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

Each block ` ```ruby literate`  creates an example group with title `"literate block in #{file}:#{start_lnb}..#{end_lnb}"`.

Then an anonymous example `it do ...` 
and instance_evals the lines from the block in this example's context.


### Setup?

Not yet in the literate file.

However you can setup your code around the call of `doctest` 

Given this literate file

      ```ruby literate
          foo.reverse #=> 'oof'
      ```

will perfectly work if you setup your spec as follows

```ruby
    RSpec.describe 'FOO', type: :literate do
      let(:foo){ 'foo' }
      doctest('literate_file.md')
    end
```



### Explicit Title of the generated Example Group

Just add text  after ` ```ruby literate`

E.g.

      ```ruby literate Assure errors are empty

          ...
          expect(errors).to be_empty
          
      ```
