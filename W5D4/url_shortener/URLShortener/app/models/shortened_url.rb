require 'securerandom'

class ShortenedURL < ApplicationRecord
  include SecureRandom

  validates :long_url, :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64(22)
    return code if !self.exists?(:short_url => code)
    self.random_code
  end
end