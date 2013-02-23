class Guide < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
  has_one :topic
  has_many :comments
  has_many :steps

  scope :published, where(state: 1)
end
