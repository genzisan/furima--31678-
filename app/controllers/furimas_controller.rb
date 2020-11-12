class FurimasController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: [:new]
  #def index
   # @furimas = Furima.all
  #end

  def new
    @furimas = Furima.new
  end

  def create
    @furimas = Furima.new(furima_params)
    if @furimas.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def furima_params
    params.require(:furima).permit(:furima_name, :category_id, :price, :day_id, :status_id, :details, :delivery_id, :prefecture_id, :user, :image).merge(user_id: current_user.id)
  end

   def move_to_index
    unless user_signed_in?
    redirect_to action: :index
   end
  end
end
