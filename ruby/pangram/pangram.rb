module BookKeeping
  VERSION = 2
end

module Pangram
  ALPHABET = *('a'..'z')

  def self.is_pangram?(str)
    (str.downcase.chars & ALPHABET).length == ALPHABET.length
  end
end
