require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "GET /index" do
    it "成功したレスポンスを返す" do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
