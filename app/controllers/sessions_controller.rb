class SessionsController < ApplicationController
  def create
    @player = Player.authenticate(params[:email], params[:password])
    if @player
      flash[:notice] = "You've signed in."
      session[:player_id] = @player.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:player_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to "/"
  end
end
