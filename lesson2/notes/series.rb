# Write a program that will take a string of digits and return all possible consecutive number series of length N in that string

class Series

  def slices
  end

  def string_to_digits(string)
    string.chars.map.to_i
  end

end

test = Series.new
puts test.string_to_digits('1234')