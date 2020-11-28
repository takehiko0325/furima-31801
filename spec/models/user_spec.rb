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
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
      it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
      it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    it 'emailが@を含んだ形式でないと保存できないこと' do  
       @user.email = 'aaaaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end 

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが半角英数混合でなければ登録できない(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers.")
    end

    it 'passwordが一致しなければ登録できない)' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aanaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが６文字以上なければ登録できない)' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数混合でなければ登録できない(半角数字のみ)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers.")
   end
   
      it "first_nameが空だと登録できない" do
        
        @user.first_name = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角日本語でないと保存できない' do
        @user.first_name = "ｽｽﾞｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
  
      it "family_nameが空だと登録できない" do
          
          @user.family_name = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name can't be blank"
        end
        it 'family_nameが全角日本語でないと保存できないこと' do
          @user.family_name = "ｽｽﾞｷ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
        end

      it "first_name_kanaが空だと登録できない" do
        
          @user.first_name_kana = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end
        it 'family_nameが全角カナでないと保存できないこと' do
          @user.family_name = "ｽｽﾞｷ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
        end

      it "family_name_kanaが空だと登録できない" do
          
          @user.family_name_kana = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kana can't be blank"
         end

         it 'family_nameが全角カナでないと保存できないこと' do
          @user.family_name = "ｽｽﾞｷ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
         end

      it "birthdayが空だと登録できない" do
          @user.birthday = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "Birthday can't be blank"
         end
      
    end 
   end  
  end



