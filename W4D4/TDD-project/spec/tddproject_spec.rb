require 'rspec'
require 'tddproject'

# REMOVE DUPS LIST OF TESTS:
# - returns a new array with duplicates removed

describe '#my_uniq' do
  it 'returns a new array with duplicates removed' do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end
end

# TWO SUM TESTS:
# - returns a 2D array containing the pairs of elements that sum to 0
# - returns pairs are sorted increasingly (lowest to highest)

describe '#two_sum' do
  it 'returns a 2D array containing the indices of element pairs that sum to 0' do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
  
  it 'returns pairs in increasing order' do
    expect([-4, 2, 3, 0, 4, -2, -3].two_sum).to eq([[0,4],[1,5],[2,6]])
  end
end

# MY TRANSPOSE TESTS:
# - returns a transposed array with row and columns swapped

describe '#my_transpose' do
  it 'returns a transposed array with row and columns swapped' do
    expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end
end

# STOCK PICKER

describe '#stock_picker' do
  it 'returns an array containing min and max value indices' do
    expect(stock_picker([7, 12, 14, 10, 9, 2, 20])).to eq([5, 6])
  end

  it 'includes min value index that is lower than max value index' do
    expect(stock_picker([7, 12, 14, 20, 9, 2, 10])).to eq([0,3])
  end

  it 'returns an array with largest difference between low and high values' do
    expect(stock_picker([7, 12, 6, 20, 9, 2, 10])).to eq([2,3])
  end
end

# TOWERS OF HANOI
# - can't place a larger disc on top of a smaller disc
# - gets input from the user on which pile to select from
# - gets input from the user on which pile to move to

describe '#tower_of_hanoi' do
  it ''
end