require 'rails_helper'

RSpec.describe OrderAddresse, type: :model do
  describe '購入情報の保存' do
    before do
      @order_addresse = FactoryBot.build(:order_addresse)
    end

  

    context "購入情報が保存できる場合" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_addresse).to be_valid
      end
    end

    context "購入情報が保存できない場合" do
      it '郵便番号が空だと保存できないこと' do
        @order_addresse.post_code  = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_addresse.post_code  = "1234567"
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県のprefectre_idが1以上でないと保存できない' do
        @order_addresse.prefectre_id  = 0
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Prefectre must be other than 0")
      end
      it '市区町村が空だと保存できないこと' do
        @order_addresse.city  = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_addresse.house_number  = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_addresse.phone_number  = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内じゃないと保存できないこと' do
        @order_addresse.phone_number  = "111111111111"
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空だと保存できないこと' do
        @order_addresse.token  = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end