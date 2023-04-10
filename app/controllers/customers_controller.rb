class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @items = @customer.items
    @item = Item.new
  end

  def create
    @customer = Customer.find(params[:id])
    @supermarket = Supermarket.find(params[:supermarket_id])
    @item = @supermarket.items.create!(item_params)
    @item.save
    @customer.items < @item
    
    redirect_to "/customers/#{@customer.id}"

  end

  private

  def item_params
    params.permit(:name, :price, :supermarket_id)
  end
end