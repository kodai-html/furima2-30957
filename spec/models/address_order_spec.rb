require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @address = FactoryBot.build(:address_order, item_id: @item, user_id: @user)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいく時' do
      it '全てが存在する時' do
        expect(@address).to be_valid
      end
      it "建物名が空でも購入できる" do
        @address.building = ""
        @address.valid?
      end
    end
    context '商品購入がうまくいかない時' do
      it 'item_id が空だと登録できない' do
        @address.item_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_id が空だと登録できない' do
        @address.user_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end
      it '郵便番号が空だと登録できない' do
        @address.postal_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @address.postal_code = "1234321"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code ハイフンを含めてください。")
      end
      it '都道府県が--だと登録できない' do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村がないと登録できない' do
        @address.municipality = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地がなければ登録できない' do
        @address.address = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it '携帯電話がなければ登録できない' do
        @address.number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Number can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
      it "電話番号は12桁異常では登録できない" do
        @address.number = "123456789100"
        @address.valid?
        expect(@address.errors.full_messages).to include("Number 半角数字12字未満、ハイフンなしでお願いします。")
      end
      it "電話番号に文字は登録できない" do
        @address.number = "電話番号に漢字を使う。"
        @address.valid?
        expect(@address.errors.full_messages).to include("Number 半角数字12字未満、ハイフンなしでお願いします。")
      end
    end
  end
end
