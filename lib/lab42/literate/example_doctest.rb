module Lab42::Literate::ExampleDoctest
  require_relative 'extractor'
  Ex = Lab42::Literate::Extractor

  def doctest filename
    doc_blocks = Ex.extract(File.readlines(filename))
    doc_blocks.each do  |_, lines|
      instance_eval(lines.join("\n"))
    end


  end
  
end
