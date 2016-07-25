module BookKeeping
  VERSION = 2
end

module Pangram
  ALPHABET_LEN = 26

  def self.is_pangram?(str)
    str.downcase.chars.uniq.select { |c| c =~ /[a-z]/ }.length == ALPHABET_LEN
  end
end
