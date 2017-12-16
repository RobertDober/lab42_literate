module Lab42::Literate::Extractor extend self

  START_EXTRACTION = %r[\A \s* ``` ruby \s+ literate ]x
  STOP_EXTRACTION  = %r[\A \s* ``` \s* \z]x

  ALTERNATE_EQ_FORM = %r[\A (\s*) (.*) \s+ \#=> \s+ (.*) \z]x

  def extract from_lines
    hash = Hash.new{|h, k| h[k] =[]}
    from_lines
      .each_with_index
      .inject([:outside, 0,  hash]){|state, (line, lnb)| update(line, lnb, *state) }
      .last
  end


  private

  # Potentially convert alternate equality syntax to class equality synatx, meaning that
  # \A(.*)\s+#=>\s+(.*)\z => expect(strip($1)).to eq(strip($2))
  def convert line
    p line
    line.chomp.sub(ALTERNATE_EQ_FORM){ |*| 
      %W{#{$1}expect(#{$2}).to eq(#{$3.strip})}.join(' ') }
  end

  def update line, lnb, state, last_lnb, blocks
    if state == :outside
      update_outside line, lnb, blocks
    else
      update_inside line, last_lnb, blocks
    end
  end

  def update_inside line, last_lnb,  blocks
    if STOP_EXTRACTION === line.chomp
      [:outside, nil, blocks]
    else
      [:inside, last_lnb, blocks.merge(last_lnb => blocks[last_lnb] << convert(line))]
    end
  end

  def update_outside line, lnb, blocks
    if START_EXTRACTION === line.chomp
      [:inside, lnb, blocks]
    else
      [:outside, nil, blocks]
    end
  end
  
end
