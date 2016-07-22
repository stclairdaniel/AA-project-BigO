def decode(line)
  cache_size, instructions = line.split(" ")
  cache_size = cache_size.to_i
  instructions = instructions.split("")
  [cache_size, instructions]
end

def print_cache(cache_size, instructions)
  cache = []
  instructions.each do |instruction|
    puts cache.join("") if instruction == "!"
    next if instruction == "!"
    if cache.size >= cache_size
      if cache.include?(instruction)
        cache.delete(instruction)
        cache << instruction
      else
        cache.delete_at(0)
        cache << instruction
      end
    else
      if cache.include?(instruction)
        cache.delete(instruction)
        cache << instruction
      else
        cache << instruction
      end
    end
  end
end

def print_all
  file = File.open('cache_lines.txt')
  lines = file.readlines.map(&:chomp)
  lines.each_with_index do |line, index|
    puts "SIMULATION #{index + 1}"
    cache_size, instructions = decode(line)
    print_cache(cache_size, instructions)
  end
end
