require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it '全て存在する時' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it '商品名がないと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がなければ登録できない' do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'カテゴリーが選択されてなければ登録できない' do
        @item.category_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が選択されていなければ登録できない' do
        @item.state_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end
      it '配送料の負担が選択されいなければ登録できない' do
        @item.burden_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end
      it '発送元が選択されていなければ登録できない' do
        @item.prefecture_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '日数が選択されていなければ登録できない' do
        @item.delivery_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery is not a number")
      end
      it '価格がなければ登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は¥300~¥9.999,999でなければ登録できない' do
        @item.price = 40
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300~¥9.999,999でお願いします")
      end
      it '販売価格は半角数字でなければ登録できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字でお願いします。")

      end
    end
  end
end

