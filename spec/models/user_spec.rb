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
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
      end
      it 'passwordが半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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

 
      it "first_nameが空だと登録できない" do
        
        @user.first_name = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
  
      it "family_nameが空だと登録できない" do
          
          @user.family_name = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name can't be blank"
        end

      it "first_name_kanaが空だと登録できない" do
        
          @user.first_name_kana = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end
    
      it "family_name_kanaが空だと登録できない" do
          
          @user.family_name_kana = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kana can't be blank"
         end
      it "birthdayが空だと登録できない" do
          @user.birthday = ""  
          @user.valid?
          expect(@user.errors.full_messages).to include "Birthday can't be blank"
         end
      
    end 
   end  
  end

