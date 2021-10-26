require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '正常系' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '異常系' do
      it '郵便番号が空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'tokenが空だと保存できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it '郵便番号が半角のハイフンを含んだ形式でないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号が８桁だと保存できない' do
        @purchase_address.postal_code = '123-12345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号の文字数が足りないと保存できない' do
        @purchase_address.postal_code = '123-123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県、選択がない場合は登録できない' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?

        expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it '都道府県、空の場合は登録できない' do
        @purchase_address.shipping_area_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市町が空だと保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?

        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと保存できない' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が全角10桁以上11桁以内だと保存できない' do
        @purchase_address.telephone_number = '１２３４５６７８９０１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号が半角12桁以上だと保存できない' do
        @purchase_address.telephone_number = '1234567890123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号が足りない場合だと保存できない' do
        @purchase_address.telephone_number = 12_345
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が異常な番号の場合だと保存できない' do
        @purchase_address.telephone_number = 123 - 123 - 123
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
