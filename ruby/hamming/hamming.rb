module BookKeeping
  VERSION = 3
end

module Hamming
  def self.compute(s1, s2)
    raise ArgumentError if s1.length != s2.length

    i = 0
    s1.chars.reduce(0) do |acc, c|
      acc += 1 unless c == s2[i]
      i += 1
      acc
    end
  end
end
