class API::UsersController < API::ApplicationController
  def library
    user = User.find(params[:user_id])
    items = user.library
    render json: items
  end
end
