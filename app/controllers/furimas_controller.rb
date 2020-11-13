class FurimasController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, only: [:edit, :show, :update]
  
  def index
    @furimas = Furima.includes(:user).order("created_at DESC")
  end

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

  def show
  end

  def edit
    if user_signed_in? && current_user.id == @furima.user_id
      @furima =Furima.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    if @furima.update(furima_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_furima
    @furima = Furima.find(params[:id])
  end

  def furima_params
    params.require(:furima).permit(:furima_name, :category_id, :price, :day_id, :status_id, :details, :delivery_id, :prefecture_id, :user, :image).merge(user_id: current_user.id)
  end

   def move_to_index
    unless user_signed_in?
    redirect_to action: :index
   end
  end
end
