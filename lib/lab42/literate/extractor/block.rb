class Lab42::Literate::Extractor::Block
  attr_reader :lines, :start_lnb, :title

  def add_line line
    lines << line
  end

  def get_title alternative
    title.empty? ?  alternative : title
  end
  
  def range
    start_lnb..(start_lnb.pred + lines.size)
  end

  private

  def initialize start_lnb, title: ''
    @lines     = []
    @start_lnb = start_lnb
    @title     = title
  end
  
end
