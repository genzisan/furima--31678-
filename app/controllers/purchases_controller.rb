class PurchasesController < ApplicationController
  before_action :set_params, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @furima.user_id || @furima.purchase != nil
    @purchase = PurchaseAddress.new
    #elsif @furima.purchase.id = nil
      #redirect_to root_path
    #end
  end

  def create
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

  def set_params
    @furima = Furima.find(params[:furima_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_a1ae69176d8ad520d47539b5"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @furima.price,  # 商品の値段
        card: params[:token],    # カードトークン
        currency: 'jpy'           # 通貨の種類（日本円）
      )
  end
end