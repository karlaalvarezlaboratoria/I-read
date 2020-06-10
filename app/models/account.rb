# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  has_many :bookshelves

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |account|
      account.email = auth['info']['email']
      account.password = Devise.friendly_token[0, 20]
      account.username = auth['info']['username']
      account.name = auth['info']['name']
      account.avatar = auth['info']['image']
    end
  end
end
