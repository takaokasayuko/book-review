require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "成功したレスポンスを返す" do
      get "/signup"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /signup" do
    let(:user_params)do
      { user: { email: "test@example.com", password: "password" } }
    end
    
    it "新規ユーザー登録後ホーム画面にリダイレクト" do
      expect {
        post "/signup", params: user_params
    }.to change(User, :count).by(1)
    expect(response).to have_http_status(:see_other)

    get root_path
    expect(response).to have_http_status(:ok)
    end
  end
end
