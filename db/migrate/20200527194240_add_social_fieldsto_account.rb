# frozen_string_literal: true

# Class AddSocialFieldstoAccount
#
class AddSocialFieldstoAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :uid, :string
    add_column :accounts, :provider, :string
    add_column :accounts, :username, :string, null: false, default: ''
    add_column :accounts, :name, :string
    add_column :accounts, :avatar, :string
  end
end
