# Challenges: Medium 1
# 23 August, 2017
# Exercise 5: Circular Buffer

class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def clear
    @buffer.clear
  end

  def read
    return raise BufferEmptyException if empty?

    @buffer.shift
  end

  def write(item)
    return raise BufferFullException if full?
    return if item.nil?

    @buffer << item
  end

  def write!(item)
    return if item.nil?
    
    read if full?
    write(item)
  end

  private

  def empty?
    @buffer.empty?
  end

  def full?
    @buffer.size == @size
  end
end

class BufferEmptyException < Exception; end

class BufferFullException < Exception; end