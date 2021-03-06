class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create

    @player = Player.new(player_params)

   if @player.save!
     @player.update(:power => 2, :health => 50)
     flash[:notice] = "You've successfully signed up!"
     session[:player_id] = @player.id
     redirect_to "/"
   else
     flash[:alert] = "There was a problem signing up."
     redirect_to '/signup'
   end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
      if @player.update(player_params)
        flash[:notice] = 'Weapon Equiped'
        redirect_to levels_path
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:email, :password, :password_confirmation, :name, :weapon_id, :level_id, :n_stat, :s_stat, :e_stat, :w_stat)
    end
end
