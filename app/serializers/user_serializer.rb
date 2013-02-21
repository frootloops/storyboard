class UserSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :token, :name

  def token
    object.authentication_token
  end
end
