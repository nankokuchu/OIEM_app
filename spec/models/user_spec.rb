require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(0.5)
  end

  context '会員登録ができること' do
    it 'name,email,nickname,first_name,last_name, first_name_reading, last_name_reading, birthday, passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが6文字以上であれば登録できること' do
      @user.password = '123456a'
      @user.password_confirmation = '123456a'
      expect(@user).to be_valid
    end
  end

  context '会員登録ができないこと' do
    it 'emailが空だと登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it 'emailに＠がないと登録できないこと' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'emailが重複すると登録できないこと' do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordとpassword_confirmationが不一致であれば登録できないこと' do
      @user.password = '123456a'
      @user.password_confirmation = '123456b'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'passwordが6文字以下の場合登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordが全角数値であれば登録できないこと' do
      @user.password = '１２３４５６あ'
      @user.password_confirmation = '１２３４５６あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには半角数値と英文字が必須です')
    end

    it 'passwordが数値のみであると登録できないこと' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには半角数値と英文字が必須です')
    end

    it 'passwordが英字のみであると登録できないこと' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには半角数値と英文字が必須です')
    end

    it 'nicknameが空だと登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'first_nameが空だと登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end

    it 'first_nameが半角だと登録できないこと' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は全角文字をご利用してください')
    end

    it 'last_nameが空だと登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を入力してください')
    end

    it 'last_nameが半角だと登録できないこと' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字は全角文字をご利用してください')
    end

    it 'first_name_readingが空だと登録できないこと' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前のカタカナを入力してください')
    end

    it 'first_name_readingが半角だと登録できないこと' do
      @user.first_name_reading = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前のカタカナは全角カタカナを記入してください')
    end

    it 'first_name_readingが全角ひらがなだと登録できないこと' do
      @user.first_name_reading = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前のカタカナは全角カタカナを記入してください')
    end

    it 'first_name_readingが漢字だと登録できないこと' do
      @user.first_name_reading = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前のカタカナは全角カタカナを記入してください')
    end

    it 'last_name_readingが空だと登録できないこと' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字のカタカナを入力してください')
    end

    it 'last_name_readingが半角だと登録できないこと' do
      @user.last_name_reading = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字のカタカナは全角カタカナを記入してください')
    end

    it 'last_name_readingが全角ひらがなだと登録できないこと' do
      @user.last_name_reading = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字のカタカナは全角カタカナを記入してください')
    end

    it 'last_name_readingが漢字だと登録できないこと' do
      @user.last_name_reading = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字のカタカナは全角カタカナを記入してください')
    end

    it 'birthdayが空だと登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end
