class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :token_authenticatable

  has_many :guides
  has_many :comments

  before_create :ensure_authentication_token

  class << self
    def find_by_token(token)
      User.find_by_authentication_token token
    end
  end
end
