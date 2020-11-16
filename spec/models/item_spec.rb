require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context "商品の出品が保存できる場合" do
      it "出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば商品出品は保存される" do
        expect(@item).to be_valid
      end
    end
    context "商品の出品が保存できない場合" do
      it "商品画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと保存できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーがないと保存できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "商品の状態がないと保存できない" do
        @item.condetion_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condetion can't be blank", "Condetion is not a number")
      end
      it "配送料の負担がないと保存できない" do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank", "Postage payer is not a number")
      end
      it "発送元の地域がないと保存できない" do
        @item.prefectre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectre can't be blank", "Prefectre is not a number")
      end
      it "発送までの日数がないと保存できない" do
        @item.handling_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling time can't be blank", "Handling time is not a number")
      end   
      it "販売価格がないと保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it "販売価格が半角数字でないと保存できない" do
        @item.price = "ssss"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格の範囲が、¥300~¥9,999,999でないと保存できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      
    end
  end
end