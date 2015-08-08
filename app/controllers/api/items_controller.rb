class API::ItemsController < API::ApplicationController
  def index
    items = Item.list.page(params[:page]).per(params[:per_page])
    render json: items, meta: pagination(items, params[:per_page])
  end
end
