require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it 'nicknameとemail、encrypted_password、familyname、firstname、familyname_kana、firstname_kana、birthdateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationがが6文字以上であれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'passwordは半角英数字混合での入力であれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが全角では登録できない' do
        @user.password = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英語のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Please set including both letters and numbers")
      end
      it 'passwordは半角数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Please set including both letters and numbers")
      end

      it 'familynameが空では登録できない' do
        @user.familyname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'familyname_kanaが空では登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana can't be blank")
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'birthdateが空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end

      # ユーザー本名全角入力のテスト

      it 'familynameが全角(ひらがな、カタカナ、漢字)でなければ登録できない' do
        @user.familyname = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname is invalid')
      end

      it 'firstnameが全角(ひらがな、カタカナ、漢字)でなければ登録できない' do
        @user.firstname = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end

      # ユーザー本名全角カタカナ入力テスト

      it 'familyname_kanaが全角カタカナでなければ登録できない' do
        @user.familyname_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kana is invalid')
      end

      it 'firstname_kanaが全角カタカナでなければ登録できない' do
        @user.firstname_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
    end
  end
end
