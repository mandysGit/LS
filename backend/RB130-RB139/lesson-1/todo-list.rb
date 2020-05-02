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

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end



class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.instance_of? Todo
      todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  def size
    todos.size
  end

  def first
    todos.first
  end
   
  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |todo| todo.done? == true }
  end

  def item_at(index)
    todos.fetch(index)
  end

  private 

  attr_accessor :todos
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# size
p list.size                       # returns 3

# first
p list.first                      # returns todo1, which is the first item in the list

# last
p list.last                       # returns todo3, which is the last item in the list

#to_a
p list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
 list.item_at(100)               # raises IndexError
