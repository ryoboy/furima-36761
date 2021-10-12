require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    user = FactoryBot.build(:user)

    it 'nicknameが空では登録できない' do
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは半角英数字でないと登録できない' do
      user.password = '111111'
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

    it '名字は全角（漢字、カタカナ、ひらがな）でないと保存できない' do
      user.first_name = 'kawasoe'
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end

    it '名前は全角（漢字、カタカナ、ひらがな）でないと保存できない' do
      user.name = 'ryo'
      user.valid?
      expect(user.errors.full_messages).to include("Name is invalid. Input full-width characters.")
    end

    it '名字カナはカタカナでないと保存できない' do
      user.first_name_reading = 'かわそえ'
      user.valid?
      expect(user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
    end

    it '名前カナはカタカナでないと保存できない' do
      user.name_reading = 'りょう'
      user.valid?
      expect(user.errors.full_messages).to include("Name reading is invalid. Input full-width katakana characters.")
    end

    it '誕生日が空では保存できない' do
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    
  end
end