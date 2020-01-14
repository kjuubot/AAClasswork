class HashSet
  attr_accessor :store, :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if num_buckets <= count
        resize!
      end

      unless self[key].include?(key)
        self[key] << key
        self.count += 1
      end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    idx = num.hash % store.length
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
