require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全ての項目が入力されていれば保存できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it '重複したメールアドレスは保存できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordは半角英数字でないと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字６文字以上で入力してください')
    end

    it '名字が空だと保存できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を入力してください')
    end

    it '名前は空だと保存できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end

    it '名字カナは空だと保存できない' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）を入力してください')
    end

    it '名前カナは空だと保存できない' do
      @user.name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）を入力してください')
    end

    it '名字は全角（漢字、カタカナ、ひらがな）でないと保存できない' do
      @user.first_name = 'kawasoe'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字が無効です。全角文字で入力してください。')
    end

    it '名前は全角（漢字、カタカナ、ひらがな）でないと保存できない' do
      @user.name = 'ryo'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前が無効です。全角文字で入力してください。')
    end

    it '名字カナはカタカナでないと保存できない' do
      @user.first_name_reading = 'かわそえ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）が無効です。全角カナで入力してください。')
    end

    it '名前カナはカタカナでないと保存できない' do
      @user.name_reading = 'りょう'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）が無効です。全角カナで入力してください。')
    end

    it '誕生日が空では保存できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('誕生日を入力してください')
    end

    it 'メールアドレス@を含まない場合は登録できない' do
      @user.email = 'kawasoeryo'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'パスワードが６文字未満では登録できない' do
      @user.password = '123qq'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字６文字以上で入力してください')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'かわそえabc'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字６文字以上で入力してください')
    end

    it 'パスワードとパスワード（確認用）が不一致では登録できない' do
      @user.password = 'abc123'
      @user.password = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
  end
end
