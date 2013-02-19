class Comment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :guide
  belongs_to :user
end
