def echo_with_yield(str)
  puts str
  #yield
  #str
  
end

p echo_with_yield("hello") 


def time_it
  time_before = Time.now
  sleep(5)
  time_after = Time.now
  
  puts "It took #{time_after - time_before} seconds."
end


time_it