class OrdersController < ApplicationController
  before_action :authenticate_user!,  only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: :index

  def index
    @order_donation = OrderDonation.new
  end

  def create
    @order_donation = OrderDonation.new(donation_params)
    if @order_donation.valid?
      @order_donation.save
      redirect_to  root_path
    else
      render action: :index
    end
  end

  def show
    @orders = Order.where(user_id: current_user.id).order("created_at DESC")
  end

  private
  def donation_params
    params.require(:order_donation).permit(:quantity, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, food_id: params[:food_id])
  end

  def set_item
    @food = Food.find(params[:food_id])
  end

  def move_to_root_path
    if current_user.id == 1
      redirect_to root_path
    end
  end
end
