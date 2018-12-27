class ManagersController < ApplicationController
  before_action :authenticate_store!
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  # GET /managers
  # GET /managers.json
  def index
    @managers = Manager.where(store_id: current_store.id)
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
  end

  # GET /managers/1/edit
  def edit
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @store = @manager.store
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to @store, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manager
    @manager = Manager.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manager_params
    params.require(:manager).permit(:name)
  end
end
