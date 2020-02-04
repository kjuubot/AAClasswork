class Sub < ApplicationRecord
  validates :title, :description, :mod_id, presence: true

  belongs_to :mod,
    foreign_key: :mod_id,
    class_name: :User

  has_many :posts,
    foreign_key: :sub_id,
    class_name: :Post,
    dependent: :destroy

end
