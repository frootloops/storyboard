require 'spec_helper'

describe Api::V1::SessionsController do
  it "should get v1" do
    post '/api/v1/sessions/create'
    assert_response 200
  end
end