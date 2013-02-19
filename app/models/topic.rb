class Topic < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :guide
end
