# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  def self.find_for_github_oauth(auth, _signed_in_resource = nil)
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

  def self.create_unique_string
    SecureRandom.uuid
  end
end
