require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '購入情報の保存' do
    before do
      @order_item = FactoryBot.build(:order_item)
    end

    context '情報の保存がうまくいく時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_item).to be_valid
      end
      it '建物名が抜けていても登録できる' do
        @order_item.building_name = ''
        expect(@order_item).to be_valid
      end
    end
    context '情報の保存がうまくいかない時' do
      it 'postal_codeが空だと保存できない' do
        @order_item.postal_code = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @order_item.postal_code = '1234567'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Postal code is invalid. Input correctly")
      end
      it 'prefectureが空だと保存できない' do
        @order_item.prefecture = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが0だと保存できない' do
        @order_item.prefecture = '0'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_item.city = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @order_item.house_number = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numeberが空だと保存できない' do
        @order_item.phone_number = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numeberにハイフンがあると保存できない' do
        @order_item.phone_number = '-'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone number can't be blank. Input only number")
      end
      it 'phone_numeberが11桁以上だと保存できない' do
        @order_item.phone_number = '01234567890123'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空では保存できない' do
        @order_item.token = nil
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
