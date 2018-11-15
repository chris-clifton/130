def times(number)
  counter = 0
  while counter < number do
    yield(counter) if block_given?
    counter += 1
  end

  puts number
end

times(5) do |num|
  puts num
end

