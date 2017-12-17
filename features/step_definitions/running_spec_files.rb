
Given("the spec_file named {string}") do |string|
  @the_spec_file = spec_path(string)
  raise RuntimeError, "spec #{string} does not exist" unless File.readable?(@the_spec_file)
end

When("I run it") do
  @output = %x{bundle exec rspec --no-color #{@the_spec_file}}
  @status = $?
end


Then("I can see that all went alright!") do
  expect(@output).to match(%r{^ \d+ \s+ examples?, \s+ 0 \s+ failures}x)
  expect(@status.to_i).to be_zero
end

