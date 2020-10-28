require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "emailが一意性でないければ登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordが5文字以下では登録できない" do
    end
    it "passwordが半角英数字が入っていなければ登録できない" do
    end
    it "encrypted_passwordが2回入力がなければ登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "first_nameが全角でなければ登録できない" do
    end
    it "last_nameが全角でなければ登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "first_name_kanaが全角でなければ登録できない" do
    end
    it "last_name_kanaが全角でなければ登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
  end
end
