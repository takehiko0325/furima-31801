require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  
  end

  describe '商品出品' do
    context "商品の出品ができる場合" do
      it "すべての情報が登録できる" do
        expect(@item).to be_valid
      end
    
    end
    context "商品が出品できない場合" do
      it "画像がないと商品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を選択して下さい")
      end     
      it "商品名がないと商品は保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      
      it "商品の説明がないと商品は保存できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end      
      it "カテゴリーが選択されないと商品は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい")
      end 
      it "商品の状態が選択されないと商品は保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択して下さい")
      end     
      it "配送料の負担が選択されないと商品は保存できない" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択して下さい")
      end     
      it "発送までの日数が選択されないと商品は保存できない" do
        @item.preparetion_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択して下さい")
      end     
      it "発送元の地域が選択されないと商品は保存できない" do
        @item.delivery_source_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択して下さい")
      end      
      it "価格があり、尚且つ300~99999999円の範囲内、且つ半角数字で無いと商品は保存できない" do
        @item.payment  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格は300~99999999円の範囲で設定して下さい", "価格を半角数字で入力して下さい")
      end   
      #it '価格が半角数字でなければ登録できない(半角数字のみ)' do
        #@item.payment = "aaaaaaa"
       # @item.valid?
       # expect(@item.errors.full_messages).to include("価格を半角数字で入力して下さい")
     # end
      #it '価格が299円以下だと出品できない' do
      #  @item.payment = 299
      #  @item.valid?
      #  expect(@item.errors.full_messages).to include("Payment must be greater than or equal to 300")
     # end
      #it '価格が100000000円以上だと出品できない' do
       # @item.payment = 100000000
      #  @item.valid?
      #  expect(@item.errors.full_messages).to include("Payment must be less than or equal to 99999999")
     # end
    
    
    


      it "ユーザーが紐付いていないと商品は出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end