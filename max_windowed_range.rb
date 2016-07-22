require './detour'

def naive(array, w)
  max_range = nil
  (0..array.size-w).each do |start_pos|
    window = array[start_pos, w]
    max = window.max
    min = window.min
    current_range = max - min
    max_range = current_range if max_range.nil? || current_range > max_range
  end
  max_range
end

def optimized(array, w)
  array_dup = array.dup
  windows = StackQueue.new
  until windows.size == w
    windows.enqueue(array_dup.shift)
  end
  max = windows.max
  min = windows.min
  max_range = max - min

  array_dup.each do |el|
    windows.dequeue
    windows.enqueue(el)

    max = windows.max
    min = windows.min
    max_range = max - min if max - min > max_range
  end
  max_range
end
