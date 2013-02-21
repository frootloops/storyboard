require 'spec_helper'

describe Api::V1::UsersController do
  let(:user) { FactoryGirl.create :user }
  let(:auth_token) { user.authentication_token }

  it 'should create user' do
    expect {
      post '/api/v1/users', { email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678', name: 'apc' }
    }.to change(User,:count).by(1)
  end

  it 'should update email' do
    put "/api/v1/users/#{user.id}", { email: 'newemail@gmail.com' }, { 'Authorization' => auth_token }
    expect(user.reload.email).to eql 'newemail@gmail.com'
  end

  it 'should not update id' do
    put "/api/v1/users/#{user.id}", { id: 666 }, { 'Authorization' => auth_token }
    expect(user.id).to eql user.id
  end

end