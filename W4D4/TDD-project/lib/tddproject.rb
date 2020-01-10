class Array
  def my_uniq
    output = []

    self.each { |el| output << el if !output.include?(el) }
    output
  end

  def two_sum
    output = []
    self.each_with_index do |el1, i1|
      self.each_with_index do |el2, i2|
        output << [i1, i2] if i1 < i2 && el1 + el2 == 0
      end
    end
    output
  end

end

def my_transpose(arr)
  arr.transpose
end

def stock_picker(arr)
  indices = []
  largestdiff = 0

  arr.each_with_index do |el1, i1|
    arr.each_with_index do |el2, i2|
      if (el2 - el1) > largestdiff && i2 > i1
        indices = [i1, i2]
        largestdiff = el2 - el1
      end
    end
  end
  indices
end