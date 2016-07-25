module BookKeeping
  VERSION = 3
end

class Squares
  def initialize(n)
    @numbers = (0..n).to_a
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def sum_of_squares
    @numbers.reduce { |acc, n| acc + n ** 2 }
  end

  def square_of_sum
    @numbers.reduce(:+) ** 2
  end
end
