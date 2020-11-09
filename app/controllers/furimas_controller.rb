class FurimasController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @furimas = Furima.all
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

