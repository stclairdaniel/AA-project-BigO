class MyQueue
  def initialize
    @store = []
  end

  def enqueue(n)
    @store << n
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class MyStack

  attr_reader :max, :min
  def initialize
    @store = []
    @max = nil
    @max_hash = {}
    @min = nil
    @min_hash = {}
  end

  def pop
    value = @store.pop
    if value == @max
      @max = @max_hash[value]
      @max_hash.delete(value)
    end
    if value == @min
      @min = @min_hash[value]
      @min_hash.delete(value)
    end
    value
  end

  def push(n)
    @store << n
    if @max.nil? || n > @max
      @max_hash[n] = @max
      @max = n
    end
    if @min.nil? || n < @min
      @min_hash[n] = @min
      @min = n
    end
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class StackQueue

  def initialize
    @stackqueue = MyStack.new
    @stackqueue2 = MyStack.new
  end

  def enqueue(n)
    @stackqueue.push(n)
  end

  def dequeue
    until @stackqueue.empty?
      @stackqueue2.push(@stackqueue.pop)
    end
    return_value = @stackqueue2.pop
    until @stackqueue2.empty?
      @stackqueue.push(@stackqueue2.pop)
    end
    return_value
  end

  def size
    @stackqueue.size
  end

  def empty?
    @stackqueue.empty?
  end

  def max
    @stackqueue.max
  end

  def min
    @stackqueue.min
  end
end
