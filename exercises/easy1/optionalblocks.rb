=begin
Write a method that takes an optional block.  If the block is specified, the method should execture it, and return the value returned by the block.
If no block is specified, the method should simply return string "Does not compute".

ex:

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute'

Slick LS solution

def compute
  return 'Does not compute' unless block_given?
  yield
end

=end

def compute
  if block_given?
    yield
  else
    'Does not compute'
  end
end



p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute'