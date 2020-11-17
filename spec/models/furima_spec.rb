require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '商品出品機能' do
    context '商品出品が上手くいく場合'
    it '全ての項目の入力が存在すれば保存できること' do
      expect(@furima).to be_valid
    end

    context '商品出品が上手くいかない場合'
    it '商品画像を1枚つけることが必須であること' do
      @furima.image = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @furima.furima_name = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Furima name can't be blank")
    end

    it '商品の説明が必須であること' do
      @furima.details = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Details can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @furima.category_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'カテゴリーの入力情報が１の場合保存出来ないこと' do
      @furima.category_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態についての情報が必須であること' do
      @furima.status_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
    end

    it '商品の状態の入力情報が１の場合保存出来ないこと' do
      @furima.status_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Status must be other than 1')
    end

    it '配送料の負担についての情報が必須であること' do
      @furima.delivery_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Delivery can't be blank", 'Delivery is not a number')
    end

    it '配送料の入力情報が１の場合保存出来ないこと' do
      @furima.delivery_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Delivery must be other than 1')
    end

    it '発送元の地域についての情報が必須であること' do
      @furima.prefecture_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it '発送元の地域の入力情報が１の場合保存出来ないこと' do
      @furima.prefecture_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it '発送までの日数についての情報が必須であること' do
      @furima.day_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Day can't be blank", 'Day is not a number')
    end

    it '発送までの日数の入力情報が１の場合保存出来ないこと' do
      @furima.day_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Day must be other than 1')
    end

    it '価格についての情報が必須であること' do
      @furima.price = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @furima.price = 'あああ'
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Price is not a number')
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @furima.price = 200
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @furima.price = 1_000_000_000
      @furima.valid?
      expect(@furima.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
