require 'rails_helper'

RSpec.describe "CoachDetails", type: :request do
  before do
    User.create(username: "Paulo Kim", kind: 1, name: 'paulo', password: 'paulo', description: "Jogado de Lol", whatsapp: '11980770907')
  end

  describe "GET /coach_details/:id" do
    it "returns http success" do
      get "/coach_details/1"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /coach_details/:id" do
    it "returns http error" do
      get "/coach_details/10"
      expect(response).to have_http_status(:success)
    end
  end
end
