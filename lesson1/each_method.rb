def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  puts array
end

each([1, 2, 3]) do |element|
  puts element * 2
end