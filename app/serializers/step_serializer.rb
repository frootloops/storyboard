class StepSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :description
end
