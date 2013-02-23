require 'spec_helper'

describe Api::V1::GuidesController do
  let(:user) { FactoryGirl.create :user }
  let(:auth_token) { user.authentication_token }
  let(:guide) { FactoryGirl.create :guide }

  it 'should create guide' do
    expect {
      post '/api/v1/guides', {
          title: 'Ruby school',
          description: 'description...',
          topic_id: 1,
          slug: 'myslug',
          supply: ['ruby', 'c++'] }, { 'Authorization' => auth_token }
    }.to change(Guide,:count).by(1)
  end

  it 'should update guide' do
    user.guides << guide
    put "/api/v1/guides/#{guide.id}", { title: 'New Title' }, { 'Authorization' => auth_token }

    expect { guide.reload }.to change(guide, :title).to 'New Title'
  end
end