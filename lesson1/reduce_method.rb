def reduco(array, starting_point=0)
  counter = 0
  objective = starting_point

  while counter < array.size
    objective = yield(objective, array[counter])
    counter += 1
  end
  p objective

end

my_array = [1, 2, 3, 4, 5]

# reduco(my_array) { |acc, num| acc + num if num.odd? } NoMethodError can't call + on Nil class
reduco(my_array) { |acc, num| acc + num }
reduco(my_array, 10) { |acc, num| acc + num }