module ApplicationHelper

  def current_cart
    @shopping_cart = ShoppingCart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @shopping_cart = ShoppingCart.new(customer_id: current_customer.id)
    session[:cart_id] = @shopping_cart.id
  end

end
