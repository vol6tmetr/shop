class StoresController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_store, only: :show

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    if current_customer
      if params[:search].nil? || params[:search].empty?
        @products = Product.where(store_id: params[:id])
      else
        @products_search = Product.search do
          fulltext params[:search]
          with(:store_id, params[:id])
        end
        @products = @products_search.results
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end
end
