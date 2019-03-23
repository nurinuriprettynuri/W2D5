class MaxIntSet
  #make store
  #respond to true / false
  #each index respond to item / value
  #array size is constant
  #set length of array

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    (num < @store.length) && (num >= 0)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num%20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == @store.length
    if !include?(num)
      self[num] << num 
      @count += 1
      true
    else
      false
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    len = @store.length
    # optional but useful; return the bucket corresponding to `num`
    @store[num%len]
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
