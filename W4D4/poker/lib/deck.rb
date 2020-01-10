require_relative 'card.rb'

class Deck

  attr_accessor :cards
  
  def initialize
    @cards = []
  end
  
  def generate_cards
    Card.suits.each do |suit|
      Card.values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end
  
end