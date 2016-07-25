module BookKeeping
  VERSION = 4
end

module Complement
  TRANSFORMATIONS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(dna)
    return '' unless dna =~ /^[GCTA]+$/
    dna.chars.map { |c| TRANSFORMATIONS[c] }.join('')
  end
end
