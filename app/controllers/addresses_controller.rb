class AddressesController < ApplicationController
  def index
    @addresses = Address.all.order("created_at DESC")
  end
end