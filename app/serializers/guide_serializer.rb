class GuideSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :title
end
