=begin

Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing
integers (in order) between the first and last elements of argument.

=end

def missing(sorted_array)
  range = (sorted_array[0])..(sorted_array[-1])
  results = range.select do |num|
    num unless sorted_array.include?(num)
  end
  results
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []