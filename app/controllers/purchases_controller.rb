class PurchasesController < ApplicationController
  def index
    @furima = Furima.find(params[:furima_id])
    @purchase = PurchaseAddress.new
    if user_signed_in? && current_user.id != @furima.user_id
      @furima = Furima.find(params[:furima_id])
    else
      redirect_to root_path
    end
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @purchase = PurchaseAddress.new(purchase_address_params)
    if @purchase.valid?
      @purchase.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.permit(:postal_code, :municipality, :address, :phone_number, :prefecture_id, :building_name, :token, :furima_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @furima.price, # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy'           # 通貨の種類（日本円）
    )
  end
end
