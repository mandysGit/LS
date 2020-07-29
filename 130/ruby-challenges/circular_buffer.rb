=begin
Problem:
- Create a `CircularBuffer` class
  - a cyclic buffer data structure
  - fixed-size buffer
  - connected end to end

- buffer first starts empty with predefined length
- first write goes to middle of buffer
- precending elements get added after the first one
- read removes an element from the buffer, oldest values are removed
- write to full buffer will raise an error
- write! will force overwrite the oldest elements

instance methods:
- write
- write!
- read
- clear

Exceptions:
- BufferFullEception
- BufferEmptyException

Algo:
- use Array#shift to remove old items
- use Array#push to add new items
- use Array#size to check for the limit of the buffer
=end

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise CircularBuffer::BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(item)
    return if item.nil?
    raise CircularBuffer::BufferFullException if @buffer.size == @size
    @buffer << item
  end

  def write!(item)
    return if item.nil?
    read if @buffer.size == @size
    write(item)
  end

  def clear
    @buffer = []
  end
end
