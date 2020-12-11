require 'rails_helper'
RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "name,email,password,first_name,family_name,first_name_kana,family_name_kana,birthdayが存在すれば登録できる" do
    
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
  
      it "nameが空だと登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("ニックネームを入力してください")
    end
      it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
      it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
    it 'emailが@を含んだ形式でないと保存できないこと' do  
       @user.email = 'aaaaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
  
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end 

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが半角英数混合でなければ登録できない(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数混合で入力して下さい")
    end

    it 'passwordが一致しなければ登録できない)' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aanaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが６文字以上なければ登録できない)' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは半角英数混合で入力して下さい")
    end

    #it 'passwordが半角英数混合でなければ登録できない(半角数字のみ)' do
    #  @user.password = '123456'
    #  @user.password_confirmation = '123456'
     # @user.valid?
     # expect(@user.errors.full_messages).to include("パスワードは半角英数混合で入力して下さい")
  # end
   
      it "first_nameが空だと登録できない" do
        
        @user.first_name = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it 'first_nameが全角日本語でないと保存できない' do
        @user.first_name = "ｽｽﾞｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角日本語で入力して下さい")
      end
  
      it "family_nameが空だと登録できない" do
          
          @user.family_name = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "苗字を入力してください"
        end
        it 'family_nameが全角日本語でないと保存できないこと' do
          @user.family_name = "ｽｽﾞｷ"
          @user.valid?
          expect(@user.errors.full_messages).to include("苗字は全角日本語で入力して下さい")
        end

      it "first_name_kanaが空且つ全角カナでないと登録できない" do
        
          @user.first_name_kana = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "名前(カナ)を入力してください", "名前(カナ)は全角カナで入力して下さい"
        end
       # it 'first_nameが全角カナでないと保存できないこと' do
       #   @user.first_name = "ｽｽﾞｷ"
       #   @user.valid?
      #    expect(@user.errors.full_messages).to include("名前(カナ)は全角カナで入力して下さい")
      #  end

      it "family_name_kanaが空且つ全角カナでないと登録できない" do
          
          @user.family_name_kana = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "苗字(カナ)を入力してください", "苗字(カナ)は全角カナで入力して下さい"
         end

        # it 'family_nameが全角カナでないと保存できないこと' do
        #  @user.family_name = "ｽｽﾞｷ"
        #  @user.valid?
       #   expect(@user.errors.full_messages).to include("苗字(カナ)は全角カナで入力して下さい")
       #  end

      it "birthdayが空だと登録できない" do
          @user.birthday = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "誕生日を入力してください"
         end
      
    end 
   end  
  end



