require_relative 'dog'

class DogTest < MiniTest::Test
  def setup
    @spot = Dog.new('Spot')
  end

  def is_dog; end

  def name; end

  def bark; end

  def raises_error; end
end