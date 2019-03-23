class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == @store.length
    if !include?(key)
      self[key] << key 
      @count += 1
      return true
    end
    false
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num.hash%num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = @store.flatten
    @store = Array.new(@store.length * 2){Array.new}
    arr.each do |el|
      self[el] << el
    end
  end
end
