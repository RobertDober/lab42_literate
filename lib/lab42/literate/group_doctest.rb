module Lab42::Literate::GroupDoctest
  require_relative 'extractor'
  Ex = Lab42::Literate::Extractor

  def doctest filename
    doc_blocks = Ex.extract(File.readlines(filename))
    doc_blocks.each do  |lnb, lines|
      context "literate block in #{filename}:#{lnb}..#{lnb+lines.size-1}" do
        it do
          eval(lines.join("\n"))
        end
      end
    end
  end
  
end
