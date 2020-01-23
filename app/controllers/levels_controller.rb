class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    @player = Player.find(session[:player_id])
    4.times do |index|
    Weapon.create!(damage: rand(4..10), multiplyer: rand(1..2), debuff_effect: ['fire', 'ice', 'bleed', 'vomit'].sample, img:["https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0d9180b6-8e05-4911-b751-1856cbbc228d/dblzqjy-a7bec91e-4fd5-4888-a8be-f5e246f1c96f.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzBkOTE4MGI2LThlMDUtNDkxMS1iNzUxLTE4NTZjYmJjMjI4ZFwvZGJsenFqeS1hN2JlYzkxZS00ZmQ1LTQ4ODgtYThiZS1mNWUyNDZmMWM5NmYuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.j9nF6P8ExyaeI7TaXBzaY3Hw2_kq0ZnTEvQFsqtWtZc", "https://24.media.tumblr.com/859d7b6fff7a2547bd2c86964a8f2970/tumblr_n4h0e0PDnV1tssnuwo1_r1_500.gif", "https://i.ya-webdesign.com/images/transparent-sprite-sword-4.gif", "https://cdn.shopify.com/s/files/1/1898/7135/products/Bamboo_Groom_31_Pin_Animated_large.gif?v=1532532299", "https://i.pinimg.com/originals/c1/ce/c5/c1cec56aed61a4f0a3df573734a5a257.gif", "https://media2.giphy.com/media/3o6ZsVlojqxjgmlRWE/giphy.gif", "https://media.giphy.com/media/QWiHgl0s4eRqg/giphy.gif" ].sample, level_id: rand(1..4) )
  end
    @north = Level.create(name: Faker::Books::Lovecraft.location, location: 'north', weapon_id: Weapon.all.sample.id )
    @south = Level.create(name: Faker::Books::Lovecraft.location, location: 'south', weapon_id: Weapon.all.sample.id )
    @east = Level.create(name: Faker::Books::Lovecraft.location, location: 'east', weapon_id:Weapon.all.sample.id )
    @west = Level.create(name: Faker::Books::Lovecraft.location, location: 'west', weapon_id: Weapon.all.sample.id)
    @player = Player.find(session[:player_id])
    :index
  end


  # GET /levels/1
  # GET /levels/1.json
  def show
    @player = Player.find(session[:player_id])
    @player.update(:level_id => params[:id])
    @level = Level.find(@player.level_id)
    if @player.level.mobs == []
    @player.level.spawn_mobs
    @mobs = @player.level.mobs
  else
    if @player.health <= 0
      @player.destroy
      flash[:notice] = "You have failed your quest. Better luck next year...."
      session[:player_id] = nil
      redirect_to root_path
    end
    @mobs = @player.level.mobs
  end
  :show
  end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Level was successfully created.' }
        format.json { render :show, status: :created, location: @level }
      else
        format.html { render :new }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to @level, notice: 'Level was successfully updated.' }
        format.json { render :show, status: :ok, location: @level }
      else
        format.html { render :edit }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to levels_url, notice: 'Level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.fetch(:level, {})
    end
end
