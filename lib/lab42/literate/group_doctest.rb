module Lab42::Literate::GroupDoctest
  require_relative 'extractor'
  Ex = Lab42::Literate::Extractor

  def doctest filename
    Ex
      .extract(File.readlines(filename))
     .each{ |block| make_context filename, block }
  end

  private

  def make_context filename, block
    return if block.lines.empty?
    title = block.get_title "literate block in #{filename}:#{block.range.inspect}"
    context title do
      it do
        eval(block.lines.join("\n"))
      end
    end
  end
  
end
