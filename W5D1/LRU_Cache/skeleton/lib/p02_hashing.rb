class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    id = 0
    self.each_with_index do |ele, i|
      id ^= (ele + i)
    end

    id.hash
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a
    char_arr = self.chars

    id = 0
    char_arr.each_with_index do |char, i|
      id ^= alpha.index(char.downcase) * i
    end

    id.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    id = 0

    self.each do |key, val|
      id += key.to_s.hash if !key.is_a?(Integer)
      id += val.to_s.hash if !val.is_a?(Integer)
    end

    id.hash
  end
end
