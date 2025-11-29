require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    context "メールアドレス形式の確認" do
      it "@がない場合は無効" do
        user = build(:user, email: "testexample.com")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("の書式が正しくありません")
      end
      it "@が2つある場合は無効" do
        user = build(:user, email: "test@@example.com")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("の書式が正しくありません")
      end
      it "ドメインがない場合は無効" do
        user = build(:user, email: "test@")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("の書式が正しくありません")
      end
      it "ローカル部がない場合は無効" do
        user = build(:user, email: "@example.com")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("の書式が正しくありません")
      end
    end

    context "パスワード形式の確認" do
      it "数字のみの場合は無効" do
        user = build(:user, password: "12345678")
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("は英文字と数字を含めてください")
      end
      it "英文字のみの場合は無効" do
        user = build(:user, password: "ABCDefgh")
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("は英文字と数字を含めてください")
      end
      it "8文字未満の場合は無効" do
        user = build(:user, password: "ABc12")
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("は8文字以上で入力してください")
      end
    end
  end
end
