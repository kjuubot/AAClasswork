require "byebug"

class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if !is_valid?(num)
      raise "Out of bounds"
    else
      self.store[num] = true
    end
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
    num > 0 && num < store.length
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
   self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].each { |el| return true if el == num }
    false
  end

  private

  def [](num)
    idx = num % store.length
    store[idx]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
      if num_buckets <= count
        resize!
      end

      unless self[num].include?(num)
        self[num] << num
        self.count += 1
      end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  # def inspect
  #   p store
  # end

  private

  def [](num)
    idx = num % store.length
    store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store.concat(Array.new(num_buckets) { Array.new })
    @store.each do |arr|
      arr.each do |el|
        value = el
        arr.delete(el)
        self[value] << value
      end
    end
  end
end
