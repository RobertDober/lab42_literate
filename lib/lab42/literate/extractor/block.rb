require 'parser/current'
Parser::Builders::Default.emit_lambda = true
Parser::Builders::Default.emit_procarg0 = true

class Lab42::Literate::Extractor::Block
  attr_reader :lines, :start_lnb, :title

  def add_line line
    lines << line
  end


  def get_title alternative
    title.empty? ?  alternative : title
  end
  

  def given?
    parsed.children.first.children == [nil, :Given]
  rescue
    false
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
  
  def parsed
     @__parsed__ ||= Parser::CurrentRuby.parse(lines.join("\n"))
  end
end
