require 'card'

describe Card do
  subject(:card) { Card.new(:s, 3) }

  describe '#initialize' do
    it 'defines suit and value as attributes of card instance' do
      expect(card.suit).to be(:s)
      expect(card.value).to be(3)
    end
  end

  describe '#suits' do
    it 'returns an array containing all 4 possible suits' do
      expect(Card.suits).to eq([:s, :h, :c, :d])
    end
  end

  describe '#values' do
    it 'returns an array containing all 13 possible values' do
      expect(Card.values).to eq((2..14).to_a)
    end
  end
end