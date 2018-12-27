class OrderController < ApplicationController
  before_action :authenticate_manager!, except: :create
  before_action :set_order, only: :status

  def index
    @orders = Order.where(store_id: current_manager.store_id).order("created_at DESC")
  end

  def create
    @shopping_cart = current_customer.shopping_cart.delete
    @product_id = ProductVariant.find(@shopping_cart.shopping_cart_item.first.product_variant_id).product_id
    @store_id = Product.find(@product_id).store_id
    @order = Order.create(name: params[:name], phone_number: params[:phone_number],
                          address: params[:address], price: @shopping_cart.price, store_id: @store_id)
    @shopping_cart.shopping_cart_item.each do |item|
      product_variant = ProductVariant.find(item.product_variant_id)
      @order_item = OrderItem.new(cart_items: product_variant.title, items_quantity: item.quantity, order_id: @order.id)
      @order_item.save
    end
    flash[:notice] = 'Your order has been accepted'
    redirect_to root_path
  end

  def status
    if @order.status == 'new' && @order.manager_id.nil?
      @order.update_attributes(:status => 'Processing', :manager_id => current_manager.id)
      flash[:notice] = 'Order accepted'
    elsif @order.status == 'Processing' && @order.manager_id == current_manager.id
      @order.update_attribute(:status, 'Delivered')
      flash[:notice] = 'Order delivered'
    else
      flash[:notice] = 'You can\'t manage this order'
    end
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

end
