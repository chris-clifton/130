=begin

Write a method that returns a list of all the divisors of the positive integer pased in as an argument.
Return value van be in any sequence you wish.

=end

#input: positive integer
#output: array of divisors of that integer
#rules: array can be in any order

def divisors(number)
  1.upto(number).select do |divisor|
    number % divisor == 0
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]