class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_player

  def current_player
    if session[:player_id]
      @current_player ||= Player.find(session[:player_id])
    end
  end
  def authorize
    if !current_player
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end
end
