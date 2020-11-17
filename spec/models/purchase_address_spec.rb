require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    furima = FactoryBot.create(:furima)
    user = FactoryBot.create(:user)

    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, furima_id: furima.id)
  end

  describe '商品購入機能' do
    context '商品購入が上手くいく場合'
    it '全ての項目の入力が存在すれば保存出来ること' do
      expect(@purchase_address).to be_valid
    end

    context '商品購入が上手くいかない場合'

    it '郵便番号にはハイフンが必要であること' do
      @purchase_address.postal_code = '1111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '郵便番号は空では登録出来ないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end

    it '電話番号にはハイフンが不要であること' do
      @purchase_address.phone_number = '000-0000-0000'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号は空では登録出来ないこと' do
      sleep(1)
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end

    it '市区町村は空では登録出来ない' do
      sleep(1)
      @purchase_address.municipality = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が空では登録出来ない' do
      sleep(1)
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end

    it '都道府県は空では登録出来ない' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it '都道府県の入力情報が１の場合登録出来ない' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'トークンが空では登録出来ない' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
