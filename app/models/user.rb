class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :token_authenticatable


  has_many :guides
  has_many :comments
end
