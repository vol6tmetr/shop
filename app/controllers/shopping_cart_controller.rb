class ShoppingCartController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart

  def index
    @shopping_cart
  end

  private

  def set_cart
    @shopping_cart = ShoppingCart.find_or_create_by(customer_id: current_customer.id)
  end
end
