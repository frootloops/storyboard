class Guide < ActiveRecord::Base
  belongs_to :user
  has_one :topic
  has_many :comments
  has_many :steps
end
