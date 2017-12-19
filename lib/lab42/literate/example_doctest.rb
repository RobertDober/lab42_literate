module Lab42::Literate::ExampleDoctest
  require_relative 'extractor'
  Ex = Lab42::Literate::Extractor

  def doctest filename
    doc_blocks = Ex.extract(File.readlines(filename))
    doc_blocks.each do  |block|
      instance_eval(block.lines.join("\n"))
    end
  end
  
end
