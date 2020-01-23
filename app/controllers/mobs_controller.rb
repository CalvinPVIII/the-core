class MobsController < ApplicationController
  before_action :set_mob, only: [:show, :edit, :update, :destroy]

  # GET /mobs
  # GET /mobs.json
  def index
    @mobs = Mob.all
  end

  # GET /mobs/1
  # GET /mobs/1.json
  def show
  end

  # GET /mobs/new
  def new
    @mob = Mob.new
  end

  # GET /mobs/1/edit
  def edit
  end

  # POST /mobs
  # POST /mobs.json
  def create
    @mob = Mob.new(mob_params)

    respond_to do |format|
      if @mob.save
        format.html { redirect_to @mob, notice: 'Mob was successfully created.' }
        format.json { render :show, status: :created, location: @mob }
      else
        format.html { render :new }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobs/1
  # PATCH/PUT /mobs/1.json
  def update
    @player = Player.find(session[:player_id])
    # binding.pry
    if @mob.update(mob_params)
      damage  = 0
      @level = Level.find(@mob.level.id)
      @level.mobs.each do |mob|
        damage += mob.power/2
      end
      health = @player.health - damage
      @player.update(:health => health)
      if @mob.health <= 0
        flash[:notice] = "You've successfully bested the #{@mob.name}!"
        @mob.destroy
        @player.update(:health => (@player.health += 14))
        @player.update(:power => (@player.power += 5))
      end
      if @mob.level.mobs == []
        if @player.level.location == 'north'
          @player.update(:n_stat => true)
          redirect_to levels_path
        elsif @player.level.location == 'south'
          @player.update(:s_stat => true)
          redirect_to levels_path
          # binding.pry
        elsif @player.level.location == 'west'
          @player.update(:w_stat => true)
          redirect_to levels_path
        elsif @player.level.location == 'east'
        @player.update(:e_stat => true)
          redirect_to levels_path
        end
      else
        redirect_to level_path(@player.level.id)
      end



  else
    format.html { render :edit }
    format.json { render json: @mob.errors, status: :unprocessable_entity }
  end
end

# DELETE /mobs/1
# DELETE /mobs/1.json
def destroy
  @mob.destroy
  respond_to do |format|
    format.html { redirect_to mobs_url, notice: 'Mob was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_mob
  @mob = Mob.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def mob_params
  params.require(:mob).permit(:health)
end
end
