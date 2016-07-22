require 'set'

#O(n**2)
def bad_two_sum?(array, target)
  (0...array.size).each do |i|
    (i+1...array.size).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false
end

#O(nlogn)
def okay_two_sum?(array, target)
  array.each do |el|
     return true if binary_search(array, target - el)
   end
   false
end

#O(n)
def pair_sum?(array, target)
  set = Set.new
  array.each do |el|
    set.add(el)
  end
  array.each do |el|
    return true if set.include?(target - el)
  end
  false
end

private
def binary_search(array, target)
  middle = array.size / 2
  return false if array.empty?
  if array.size == 1
    array.first == target
  end

  if target == array[middle]
    return true
  elsif target < array[middle]
    binary_search(array.take(middle), target)
  else
    binary_search(array.drop(middle + 1), target)
  end
end
