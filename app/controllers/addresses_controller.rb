class AddressesController < ApplicationController
  def index
    @addresses = Address.all.order("created_at DESC")
    @addresses = Address.page(params[:page]).per(5).order("created_at DESC")
  end
end