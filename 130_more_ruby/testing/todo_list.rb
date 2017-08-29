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

  def undone?
    !done?
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
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    if todo.class != Todo
      raise TypeError, "Can only add Todo objects"
    else
      @todos << todo
    end
  end
  alias_method :add, :<<

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| todo.undone? }
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def done!
    @todos.each_index do |index|
      mark_done_at(index)
    end
  end

  # Returns the original object
  def each
    @todos.each do |item|
      yield(item)
    end

    self
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def first
    @todos.first
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def last
    @todos.last
  end

  def mark_done(title)
    find_by_title(title)&.done!
  end

  def mark_undone(title)
    find_by_title(title)&.undone!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  # Returns a TodoList object
  def select
    result = TodoList.new(title)
    each do |todo|
      result << todo if yield(todo)
    end

    result
  end

  def shift
    @todos.shift
  end

  def size
    @todos.size
  end

  def to_a
    @todos
  end

  def to_s
    text = "--- #{title} ---\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
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

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# ---- Deleting from the the list -----

# shift
# list.shift                      # removes and returns the first item in list

# pop
# list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(0)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
list.item_at(1).done!
# list.to_s                      # returns string representation of the list
list.each do |item|
  item.done!
end
# list.to_s
# list.each do |item|
#   item.undone!
# end
# list.to_s
results = list.select { |todo| todo.done? }
# results.to_s

list.mark_undone('Clean room')
# list.to_s

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym