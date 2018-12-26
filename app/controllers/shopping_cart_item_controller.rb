class ShoppingCartItemController < ApplicationController
  before_action :set_cart, only: :create

  def create
    params[:product_ids].zip params[:product_quantities].each do |product_variant, product_quantity|
      product_price = ProductVariant.find(product_variant).price
      if product_quantity.to_i > 0
        @shopping_cart.shopping_cart_item.new(product_variant_id: product_variant, quantity: product_quantity)
        @shopping_cart.price += product_price * product_quantity.to_i
      end
    end
    @shopping_cart.save
    flash[:notice] = 'Product added to cart'
    redirect_back fallback_location: root_path
  end

  private

  def set_cart
    @shopping_cart = ShoppingCart.find_or_create_by(customer_id: current_customer.id)
  end
end
