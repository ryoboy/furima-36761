require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it '全ての項目が入力されていれば保存できる' do
      expect(@item).to be_valid
    end

    it 'product_nameが空では登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'product_type_idが空では保存できない' do
      @item.product_type_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
    end

    it 'product_status_idが空では登録できない' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
    end

    it 'shipping_charge_idが空では登録できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
    end

    it 'shipping_area_idが空では登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元の地域は1以外の値にしてください")
    end

    it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
    end

    it 'priceが空だと保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end

    it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it '価格は、¥300未満の場合保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格¥300~¥9,999,999の間で入力してください")
    end

    it '価格は文字の場合保存できない' do
      @item.price = 'ryo'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格¥300~¥9,999,999の間で入力してください")
    end

    it '価格は、¥10,000,000以上の場合保存できない' do
      @item.price = 9, 999, 999
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格¥300~¥9,999,999の間で入力してください")
    end

    it 'ユーザーと紐づいていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end
  end
end