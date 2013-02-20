require 'spec_helper'

describe Api::V1::SessionsController do
  let(:user) { FactoryGirl.create :user }
  context 'auth with valid params' do
    it "should auth with user" do
      post '/api/v1/sessions', { user: { email: user.email, password: 'password' } }
      json = { user: { id: user.id, auth_token: user.authentication_token } }
      expect(response.body).to eql(json.to_json)
    end
  end
end