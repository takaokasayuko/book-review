require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "成功したレスポンスを返す" do
      get "/login"
      expect(response).to have_http_status(:ok)
    end
  end
end
