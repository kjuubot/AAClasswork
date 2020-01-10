class Card
  SUITS = [:s, :h, :c, :d]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  attr_reader :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def self.suits
    SUITS
  end

  def self.values
    VALUES
  end
  
end