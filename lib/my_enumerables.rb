module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_count
    return self.length unless block_given?
    counter = 0
    self.my_each do |elem|
      counter += 1 if yield(elem)
    end
    counter
  end

  def my_each_with_index
  index = 0
    self.my_each do |elem|
      yield(elem, index)
    index += 1
    end
    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end
