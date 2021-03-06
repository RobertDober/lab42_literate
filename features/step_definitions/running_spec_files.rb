
Given("the spec_file named {string}") do |string|
  @the_spec_file = spec_path(string)
  raise RuntimeError, "spec #{string} does not exist" unless File.readable?(@the_spec_file)
end

When("I run it") do
  step('I run it with option ""')
end

When("I run it with option {string}") do |option|
  @output = %x{bundle exec rspec --no-color #{option} #{@the_spec_file}}
  @status = $?
end


Then("I can see that all went alright!") do
  expect(@output).to match(%r{^ \d+ \s+ examples?, \s+ 0 \s+ failures}x)
  expect(@status.to_i).to be_zero
end

Then("I can see {string}") do |failures|
  expect(@output).to match(%r{^ \d+ \s+ examples?, \s+ #{failures}}x)
end

Then("an error of class {string} with a message matching {string} is reported") do |error, message|
  expect(@output).to match(%r{#{error}:\s*#{message}})
end

Then("no specs were run") do
  expect(@output).to match(%r{0 \s+ examples, \s+ 0 \s+ failures \s* \z}x)
end

Then("it executes {int} example") do |n|
  step("it executes #{n} examples")
end
Then("it executes {int} examples") do |n|
  expect(@output).to match(%r{#{n} \s+ examples?,}x)
end

Then("the output contains {string}") do |string|
  expect(@output).to include(string)
end

Then("the output matches {string}") do |string|
  expect(@output).to match(%r{#{string}}x)
end

