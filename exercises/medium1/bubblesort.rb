# input: array
# output: bubblesort method that takes optional block that determines which of the two consecutive elements will appear first in results


# original solution
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil

end

# Solution that yields to block, if given
def bubble_sort2!(array)
  loop do
    swapped = false
    1.upto(array.size = 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end

      array[index -1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end




end