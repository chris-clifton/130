def selecto(array)
counter = 0
objective = []

while counter < array.size
  current_element = array[counter]
  objective << current_element if yield(current_element)
  counter += 1
end
p objective
end


my_array = [1, 2, 3, 4, 5]

selecto(my_array) { |num| num.odd? }
selecto(my_array) { |num| puts num }
selecto(my_array) { |num| num + 1 }