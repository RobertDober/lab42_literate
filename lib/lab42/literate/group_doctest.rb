module Lab42::Literate::GroupDoctest
  require_relative 'extractor'
  Ex = Lab42::Literate::Extractor

  def doctest filename
   blocks =  Ex
      .extract(File.readlines(filename))

   setups, examples = blocks.partition(&:given?)
   setups.each{ |setup| make_setup filename, setup }
   examples.each{ |example| make_context filename, example }
  end

  private

  def make_context filename, example
    return if example.lines.empty?
    title = example.get_title "literate block in #{filename}:#{example.range.inspect}"
    context title do
      it do
        eval(example.lines.join("\n"))
      end
    end
  end
  
  def make_setup filename, setup
    eval(setup.lines.join("\n"))
  end
end
