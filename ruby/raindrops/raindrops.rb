module BookKeeping
  VERSION = 2
end

module Raindrops
  FACTORS = [3, 5, 7]
  DROPS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(drop)
    str = FACTORS.inject("") { |acc, f| acc += DROPS[f] if drop % f == 0; acc }
    str.empty? ? drop.to_s : str
  end
end
