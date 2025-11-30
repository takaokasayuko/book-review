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
      user_params = attributes_for(:user)
      post signup_path, params: { user: user_params }
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(:see_other)
    end
  end
end
