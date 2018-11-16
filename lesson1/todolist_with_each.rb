# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a Todolist object, including iteration and selection

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def validate_todo_object(object)
    raise TypeError.new("#{object} #{object.class}: Can only add/remove Todo objects!") unless object.class == Todo
  end

  def add(todo_object)
    validate_todo_object(todo_object)
    if @todos.include?(todo_object)
      puts "\"#{todo_object.title}\" is already on this list."
    else
      @todos << todo_object
    end    
  end
  
  alias_method :<<, :add

  def remove(todo_object)
    validate_todo_object(todo_object)
    if @todos.include?(todo_object)
      @todos.delete(todo_object)
    else
      puts "\"#{todo_object.title}\" is not on this list."
    end
  end

  def size
    @todos.length
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(location)
    @todos.fetch(location)
  end

  def mark_done_at(location)
    item_at(location).done!
  end

  def mark_undone_at(location)
    item_at(location).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(location)
    remove(item_at(location))
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def to_s
    text = "# ---- Today's Todos ---- #\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end

  def each(list)
    @todos.each do |todo| 
      yield(todo)
    end
  end

end

# given test list and todos
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Unlisted job")
list = TodoList.new("Today's Todos")

# testing add feature
list.add(todo1)
list.add(todo2)
list << todo3

#puts list
