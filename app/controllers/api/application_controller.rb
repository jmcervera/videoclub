class API::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #TODO: implement authorization for the admin site

  protected
  def pagination(paginated_array, per_page)
    {
      pagination: {
        per_page: per_page.to_i,
        current_page: paginated_array.current_page,
        total_pages: paginated_array.total_pages,
        total_objects: paginated_array.total_count
      }
    }
  end
end
