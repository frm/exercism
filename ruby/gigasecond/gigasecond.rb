module BookKeeping
  VERSION = 3
end

module Gigasecond
  GIGA_IN_MILLIS = 10**9
  def self.from(time)
    Time.at(GIGA_IN_MILLIS + time.to_i)
  end
end
