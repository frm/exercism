class Sieve
  OFFSET = 2

  def initialize(n)
    @numbers = Array.new(n - 1, false)
    @max = n
  end

  def primes
    primes = []

    @numbers.each_with_index do |value, index|
      unless value
        primes << number_for(index)
        mark_non_primes index
      end
    end

    primes
  end

  private

  def index_of(n)
    n - OFFSET
  end

  def number_for(index)
    index + OFFSET
  end

  def multiples_of(n)
    multiples = []
    i = 1

    while (i * n) <= @max
      multiples << (i * n)
      i += 1
    end

    multiples
  end

  def mark_non_primes(i)
    multiples = multiples_of(number_for i)
    multiples.each { |m| @numbers[index_of(m)] = true }
  end
end
