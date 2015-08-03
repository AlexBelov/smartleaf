class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchases = current_user.purchases
  end

  def show
    @purchase = Purchase.friendly.find(params[:id])
  end

  def new
    @purchase = Purchase.new(user_id: current_user.id)
  end

  def create
    @purchase = Purchase.create(purchase_params)
    redirect_to action: :index
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :date, :user_id, line_items_attributes: [:amount, :_destroy])
  end
end
