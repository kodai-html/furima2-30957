require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てが存在する時' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank" )
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは＠を含まれてないと登録できない" do
       @user.email = "test.com"
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwardが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは英語のみでは登録できない" do
        @user.password = "onlyenglish"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を使ってください')
      end
      it "passwordは数字のみでは登録できない" do
        @user.password = "1234321"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を使ってください')
      end
      it "passwordは全角では登録できない" do
        @user.password = "鈴木佐藤伊藤"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を使ってください')
      end
      it "passwardが存在してもpassward_confirmationが空では登録できない" do
        @user.password = "000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "苗字がなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名前がなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end 
      it "苗字の振り仮名はカタカナでなければ登録できない" do
        @user.kana_last = "山駄"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid")
      end
      it "名前の振り仮名はカタカナでなければ登録できない" do
        @user.kana_first = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")
      end
      it "生年月日がなければ登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end    
  end
end