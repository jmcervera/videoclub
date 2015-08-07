class API::ItemsController < API::ApplicationController
  def index
    items = Item.order(created_at: :desc)
    render json: items
  end
end
