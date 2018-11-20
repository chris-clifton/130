require 'pry'
# Write a program that will take a string of digits and return all possible consecutive number series of length N in that string

class Series
  attr_reader :numbers

  def initialize(string)
    @numbers = string.chars.map(&:to_i)
  end

  def slices(number)
    raise ArgumentError, 'n is too big for the string.' if number > @numbers.size
    @numbers.each_cons(number).to_a
  end
end
