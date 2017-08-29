require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test

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
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  # #setup is run so list is reset
  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_list_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_todo_done?
    assert_equal(false, @todo1.done?)
  end

  def test_all_done
    new_list = TodoList.new(@list.title)
    new_list << @todo1
    new_list << @todo2
    new_list << @todo3

    @list.done!
    assert_equal(new_list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    new_list = TodoList.new(@list.title)
    new_list << @todo1
    new_list << @todo2
    new_list << @todo3
    
    assert_equal(new_list.to_s, @list.all_not_done.to_s)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('string') }
  end

  def test_shovel
    @todo4 = Todo.new('Fix sink')        
    @list << @todo4
    @todos << @todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    @todo4 = Todo.new('Fix sink')        
    @list.add(@todo4)
    @todos << @todo4
    
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    assert_equal(false, @list.item_at(0).done?)
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(false, @list.item_at(1).done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    assert_equal(false, @list.item_at(0).done?)
    
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(1).done?)
    assert_equal(true, @list.item_at(2).done?)
  end

  def test_list_done!
    @list.done!
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(true, @list.done?)
  end

  def test_todo_done!
    @todo1.done!
    assert_equal(true, @todo1.done?)
  end

  def remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(2)
    assert_raises(IndexError) { @list.item_at(2) }
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    # As of Ruby 2.3, the HEREDOC above could also be written as:
    # <<~OUTPUT.chomp
    # --- Today's Todos ---
    # [ ] Buy milk
    # [ ] Clean room
    # [ ] Go to gym
    # OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []

    @list.each { |todo| result << todo }

    assert_equal(@todos, result)
  end

  def test_each_return
    assert_equal(@list, @list.each { |_| nil })
  end

  def test_select
    @todo1.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1)

    assert_equal(new_list.to_s, @list.select { |todo| todo.done? }.to_s)
  end
end