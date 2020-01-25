# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  age         :integer
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, :name, :description, presence: true
  validates :color, inclusion: { in: %w(black orange white brown grey),
    message: "%{value} is not a valid color" }, presence: true
  validates :sex, inclusion: { in: %w(M F)}, presence: true

  # def age
  #   birthday = :birth_date
  #   now = Time.now.utc.to_date
  #   now.year - birthday.year
  # end
end