# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6, allow_nil: true }

    attr_reader :password
    after_initialize :ensure_session_token

    def self.generate_session_token
        self.session_token = SecureRandom.urlsafe_base64(16)
        @session_token
    end

    def reset_session_token!
        self.update!(session_token: SecureRandom.urlsafe_base64(16))
        @session_token
    end

    def ensure_session_token
        @session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def self.find_by_credentials(email, password)
        user = User.find(email: email)

        user && user.is_password?(password) ? user : nil
    end

    def is_password?
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :session_token)
    end
end
