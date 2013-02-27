require 'spec_helper'

describe Api::V1::GuidesController do
  let(:user) { FactoryGirl.create :user }
  let(:auth_token) { user.authentication_token }
  let(:guide) { FactoryGirl.build :guide }

  context 'guide' do
    it 'create guide' do
      expect {
        post '/api/v1/guides', {
            title: 'Ruby school',
            description: 'description...',
            topic_id: 1,
            slug: 'myslug',
            supply: ['ruby', 'c++'] }, { 'Authorization' => auth_token }
      }.to change(Guide, :count).by(1)
    end

    it 'update guide' do
      expect {
        user.guides << guide
        put "/api/v1/guides/#{guide.id}", { title: 'New Title' }, { 'Authorization' => auth_token }
        guide.reload
      }.to change(guide, :title).to 'New Title'
    end

    context 'steps' do
      it 'add to guide' do
        user.guides << FactoryGirl.build(:guide)
        guide = user.guides.last
        expect {
          step = { title: 'First step', description: 'Long description, description, description.' }
          post "/api/v1/guides/#{guide.id}/steps", step, { 'Authorization' => auth_token }
        }.to change(guide.steps, :count).from(0).to(1)
      end

      it 'update step' do
        user.guides << FactoryGirl.build(:guide)
        user.guides.last.steps << FactoryGirl.build(:step)
        step = user.guides.last.steps.last

        expect {
          put "/api/v1/guides/#{step.guide.id}/steps/#{step.id}", { title: 'New Title' }, { 'Authorization' => auth_token }
          step.reload
        }.to change(step, :title).to 'New Title'
      end
    end
  end

  it 'should return all my guides' do
    get '/api/v1/guides', {} , { 'Authorization' => auth_token }

    expect(JSON.parse(response.body).size).to eql(user.guides.published.count)
  end
end