require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "成功したレスポンスを返す" do
      get "/signup"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /signup" do
    it "新規ユーザー登録後ホーム画面にリダイレクト" do
      user = create(:user)
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
