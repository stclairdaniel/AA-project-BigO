require 'byebug'

#O(n ** 2)
def my_min(list)
  (0...list.length).each do |i|
    (0...list.length).each do |j|
      #return i if i is smaller than all j
      next if i == j
      break if list[j] < list[i]
      return list[i] if j == list.length - 1
    end
  end
end

#O(n)
def my_min2(list)
  min = list[0]
  (0...list.length).each do |i|
    if list[i] < min
      min = list[i]
    end
  end
  min
end

#O(n**2)
def largest_contiguous_subsum(list)
  sub_arrays = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sub_arrays << list[i..j]
    end
  end
sub_arrays.map! { |sub_array| sub_array.inject(0,:+) }
sub_arrays.max
end


def largest_contiguous_subsum2(list)
  max = list.first
  current = list.first
  (1...list.size).each do |i|
    if current < 0
      current = list[i]
    else
      current += list[i]
    end
    max = current if current > max
  end
  max
end
