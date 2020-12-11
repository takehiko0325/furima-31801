require 'rails_helper'

RSpec.describe UserSell, type: :model do
  describe '取引情報の保存' do
    before do
      @buyer =FactoryBot.create(:user)     
      @seller =FactoryBot.create(:user)
      @item =FactoryBot.create(:item, user_id: @seller.id) 
      @user_sell = FactoryBot.build(:user_sell, user_id: @buyer.id, item_id: @item.id )
      sleep(1)
    end
    context '商品購入がうまくいくとき' do
      it "情報が存在すれば登録できる" do
        expect(@user_sell).to be_valid
      end
       it "building_nameが空でも登録できる" do
        @user_sell.building_name = nil
        expect(@user_sell).to be_valid
    
       end
    end
    
    context '商品購入がうまくいかないとき' do
      it "郵便番号が空だと登録できない" do
        @user_sell.post_number = ""
        @user_sell.valid?
        expect(@user_sell.errors.full_messages).to include "郵便番号を入力してください"
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_sell.post_number = '1234567'
        @user_sell.valid?
      expect(@user_sell.errors.full_messages).to include("郵便番号は(-)を含めて半角数字で入力して下さい")
      end

      it "市区町村が空だと登録できない" do
        @user_sell.city = ""
        @user_sell.valid?
        expect(@user_sell.errors.full_messages).to include "市町村を入力してください"
      end
      
      it "番地が空だと登録できない" do
        @user_sell.address = ""
        @user_sell.valid?
        expect(@user_sell.errors.full_messages).to include "番地を入力してください"
      end

      it "電話番号が空,且つ半角数字でないと登録できない" do
        @user_sell.phone_number = ""
        @user_sell.valid?
        expect(@user_sell.errors.full_messages).to include "電話番号を入力してください", "電話番号は半角数字で入力して下さい"
      end

      #it "電話番号が半角数字以外だと登録できない" do
       # @user_sell.phone_number = "aaaaaaaaa"
       # @user_sell.valid?
       # expect(@user_sell.errors.full_messages).to include "Phone number is invalid"
     # end

      it "tokenが空では登録できないこと" do
        @user_sell.token = nil
        @user_sell.valid?
        expect(@user_sell.errors.full_messages).to include("カード情報を入力してください")
      end

      it "user_idが空では登録できないこと" do
 
        @user_sell.user_id = nil
        @user_sell.valid?
        expect(@user_sell.errors.full_messages).to include("Userを入力してください")
      end

      it "item_idが空では登録できないこと" do
        @user_sell.item_id = nil
        @user_sell.valid?
        expect(@user_sell.errors.full_messages).to include("Itemを入力してください")
      end     
      
      it "発送元の地域が選択されないと商品は保存できない" do
          @user_sell.delivery_source_region_id = 1
          @user_sell.valid?
          expect(@user_sell.errors.full_messages).to include("発送元の地域を選択して下さい")
      end      

      
    end
  end
end