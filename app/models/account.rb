# frozen_string_literal: true

class Account < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :name, :username, presence: true
  validates :username, uniqueness: true

  extend FriendlyId
  friendly_id :username, use: %i[slugged history]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]
  attr_accessor :current_password

  has_many :bookshelves
  has_many :reviews
  has_many :books, through: :review

  after_create :create_bookshelves

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |account|
      account.email = auth['info']['email']
      account.password = Devise.friendly_token[0, 20]
      account.username = auth['info']['username']
      account.name = auth['info']['name']
      account.avatar = auth['info']['image']
    end
  end

  private

  def create_bookshelves
    names = ['Has read', 'Is currently reading', 'Would like to read']
    names.each do |name|
      Bookshelf.new(
        name: name,
        account_id: id
      ).save
    end
  end
end
