class Step < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :guide
end
