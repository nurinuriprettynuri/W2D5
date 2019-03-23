class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 1928394 if self.empty?
    new_num = 0
    self.each_with_index do |el, i|
      if el.is_a?(Array)
        new_num += i.hash / el.hash
      else
        i_hash = i.hash
        el_hash = el.hash
        new_num += i_hash / el_hash
      end
    end
    new_num
  end
end

class String
  
  def hash
    alphabet = ("a".."z").to_a
    string_idx = []
    self.each_char do |char|
      string_idx << alphabet.index(char)
    end
    string_idx.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k, v|
      result += (k.to_s.hash) / (v.hash)  
    end
    result
  end
end

