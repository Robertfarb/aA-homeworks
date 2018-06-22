class Stack
  attr_reader :stack

   def initialize
     @stack = []
   end

   def push(el)
     stack.push(el)
   end

   def pop
     stack.pop
   end

   def peek
     stack.last
   end
end

class Queue
  attr_reader :stack

  def initialize
    @queue = []
  end

  def enqueue(el)
    push(el)
  end

  def dequeue
    shift(el)
  end

  def peek
    stack.first
  end
end

class Map
  attr_reader :map

  def initialize(length = 0)
    @map = Array.new(length) {[]}
  end

  def set(key, value)
    map.push([key, value]) unless map.include?([key, value])
  end

  def get(key)
    map.each do |pair|
      return pair if pair.include?(key)
    end
  end

  def delete(key)
    map.each do |pair|
      map.delete(pair) if pair.include?key
    end
  end

  def show
    p @map
  end
end

# p my_map = Map.new
# p my_map.set(4, 5)
# p my_map.set(5, 6)
# p my_map.get(4)
# p my_map.delete(4)
# p my_map.show
