class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @items = @customer.items
    # @supermarket = Supermarket.find(params[:id])
  
  end
end