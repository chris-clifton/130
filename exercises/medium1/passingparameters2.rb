birds = %w(raven finch redtail eagle hawk shithawk)
p birds

def group_after_two(array)
  yield array
end


group_after_two(birds) do |array|
  raptors_array = array[2..-1]
  puts "Raptors: #{raptors_array.join(', ')}."
end