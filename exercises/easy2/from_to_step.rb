=begin
The Range#step method lets you iterate over a range of values where each value in the iteration is the previous 
value plus a "step" value. It returns the original range.

Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should 
take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your 
method should also take a block to which it will yield (or call) successive iteration values.
=end

def step(start_num, end_num, step_num)
  current_num = start_num
  loop do
    yield(current_num)
    break if current_num + step_num > end_num
    current_num += step_num
  end
  current_num
end

puts step(0, 10, 2) { |value| puts "value = #{value}"}
puts step(2, 5, 1) { |value| puts "value = #{value}"}
