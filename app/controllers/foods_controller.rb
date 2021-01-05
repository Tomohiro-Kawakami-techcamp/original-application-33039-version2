class FoodsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @foods = Food.all.order("created_at DESC")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to  foods_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to  foods_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == 1
      @food.destroy
      redirect_to  foods_path
    else
      render :edit
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == 1
      redirect_to action: :index
    end
  end

  def set_item
    @food = Food.find(params[:id])
  end
end