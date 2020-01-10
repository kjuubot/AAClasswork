require 'deck'
require 'card'

describe Deck do
  subject { Deck.new }
  describe '#initialize' do
    it 'gives the instance an empty @cards array' do
      expect(subject.cards).to eq([])
    end
  end

  describe '#generate_cards' do
    it 'populates the deck with 52 card instances' do
      expect(subject.cards.length).to eq(52)
      expect(subject.cards).to include(Card.new(:h, 12))
    end
  end
end