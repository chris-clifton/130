items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*food, wheat|
  puts food.join(', ')
  puts wheat
end

gather(items) do |apples, *food, wheat|
  puts apples
  puts food.join(', ')
  puts wheat
end

gather(items) do |apples, *food|
  puts apples
  puts food.join(', ')
end

gather(items) do |*food|
  puts food.join(', ')
end