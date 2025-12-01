require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }
  describe "GET /login" do
    it "成功したレスポンスを返す" do
      get "/login"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /login" do
    it "ログイン成功" do
      post login_path, params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to(root_path)
    end

    it "ログイン失敗" do
      post login_path, params: { session: { email: user.email, password: "12345678" } }
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include("メールアドレスまたはパスワードが正しくありません")
    end
  end

  describe "DELETE /logout" do
    it "ログアウト成功" do
      log_in(user)
      delete logout_path
      expect(response).to have_http_status(:see_other)
      expect(response).to redirect_to(login_path)
    end
  end
end
