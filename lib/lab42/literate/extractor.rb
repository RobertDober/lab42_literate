require 'ostruct'

module Lab42::Literate::Extractor extend self
  require_relative 'extractor/block'


  START_EXTRACTION = %r[\A \s* ``` ruby \s+ literate \s* (?<explicit_title> .*) ]x
  STOP_EXTRACTION  = %r[\A \s* ``` \s* \z]x

  ALTERNATE_EQ_FORM = %r[\A (\s*) (.*) \s+ \#=> \s+ (.*) \z]x

  def extract from_lines
    initial = OpenStruct.new(state: :outside, blocks: []) 
    from_lines
      .each_with_index
      .inject(initial){|acc, (line, lnb)| update(line, lnb, acc) }
      .blocks
  end


  private

  # Potentially convert alternate equality syntax to class equality synatx, meaning that
  # \A(.*)\s+#=>\s+(.*)\z => expect(strip($1)).to eq(strip($2))
  def convert line
    line.chomp.sub(ALTERNATE_EQ_FORM){ |*| 
      %W{#{$1}expect(#{$2}).to eq(#{$3.strip})}.join(' ') }
  end

  def update line, lnb, acc
    if acc.state == :outside
      update_outside line, lnb, acc
    else
      update_inside line, acc
    end
  end

  def update_inside line, acc
    if STOP_EXTRACTION === line.chomp
      merge_acc( acc, state: :outside )
    else
      acc.blocks.last.add_line(convert(line))
      acc
    end
  end

  def update_outside line, lnb, acc
    match = START_EXTRACTION.match line.chomp
    if match 
      merge_acc( acc, state: :inside, blocks: acc.blocks << Block.new(lnb, title: match['explicit_title']) )
    else
      acc
    end
  end

  def merge_acc acc, **params
    OpenStruct.new(**(acc.to_h.merge params))
  end
end
