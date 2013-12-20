class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if current_user.artists.empty?
      edit_artists_path
    else
      events_show_all_path
    end
  end
end
