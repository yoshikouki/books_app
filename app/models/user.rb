# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar

  def self.find_for_github_oauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid)
    user ||= new(provider: auth.provider,
                 uid: auth.uid,
                 name: auth.info.name,
                 email: dummy_email(auth),
                 password: Devise.friendly_token[0, 20])
    user.save
    user
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
