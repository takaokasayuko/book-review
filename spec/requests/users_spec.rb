require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "成功したレスポンスを返す" do
      get "/signup"
      expect(response).to have_http_status(:ok)
    end
  end
end
