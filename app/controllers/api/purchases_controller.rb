class API::PurchasesController < API::ApplicationController

  def create
    purchase = PurchaseItemService.new.perform(params[:user_id], params[:item_id])
    render json: purchase, status: 201

  rescue ActiveRecord::RecordNotFound => e
    render json: {text: e.message }, status: 422
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors }, status: 422
  rescue PurchaseItemService::ItemAlreadyBought => e
    render json: {text: e.message }, status: 422
  end

end
