=begin
Array#zip method takes two arrays and combines them into a single array in which each element is a two element array.
First element is from one array and second element is from second array.

Write a version of zip that does the same thing.  Shoud take two arrays as args and return new array.

=end

def zip(array1, array2)
result_array = []
  while array1.size > 0 && array2.size > 0 do
    current_sub_array = []
    current_sub_array << array1.shift
    current_sub_array << array2.shift
    result_array << current_sub_array
  end
  p result_array
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]