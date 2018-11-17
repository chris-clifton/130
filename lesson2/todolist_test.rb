require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!


require_relative 'todolist'

class TodoListTest < Minitest::Test
  
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @todos.size)
  end

  def test_first
    assert_equal(@todo1, @todos.first)
  end

  def test_last
    assert_equal(@todo3, @todos.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add("hi") }
  end

  # This test does not work
  # Here, we are comparing the output (string in local var 'goal') vs.
  # the return value of @list.add(@todo1), which outputs a string and returns nil.
  # Need to figure out how to compare output of target vs. goal local var
  def test_todo_already_on_list_message
    goal = "\"#{@todo1}\" is already on this list."
    assert_equal(goal, @list.add(@todo1))
  end

  def test_todo_not_on_list_message
  
  end

  def test_shovel
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Pay the bills")
    @list.add(new_todo)
    @todos << new_todo
    
    assert_equal(@todos, @list.to_a)    
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(5) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    @list.mark_undone_at(2)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(IndexError) { @list.mark_undone_at(5) }
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    @list.remove_at(2)
    assert_raises(IndexError) { @list.remove_at(2) }
    assert_equal([@todo1, @todo2], @list.to_a) 
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    # ---- Today's Todos ---- #
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @todo1.done!
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    # ---- Today's Todos ---- #
    [X] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.mark_all_done
    output = <<~OUTPUT.chomp
    # ---- Today's Todos ---- #
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_returns_original_list
    assert_equal(@list, @list.each { |todo| nil })
  end

  # This test is broken because of a difference between LS todolist.rb and mine.  Need to revisit and fix this test to make it work.
  # Most likely has to do with the format of the output chosen in the #to_s method- I included some hash tags that might be breaking
  # the Minitest tests
  # def test_select
  #   @todo1.done!
  #   list = TodoList.new(@list.title)
  #   list.add(@todo1)
  
  #   assert_equal(list.title, @list.title)
  #   assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  # end

end