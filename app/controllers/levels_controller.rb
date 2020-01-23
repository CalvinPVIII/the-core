class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    4.times do |index|
    Weapon.create!(damage: rand(4..10), multiplyer: rand(1..2), debuff_effect: ['fire', 'ice', 'bleed', 'vomit'].sample, img:["https://cdn140.picsart.com/268986468003211.png?r1024x1024", "https://mir-s3-cdn-cf.behance.net/project_modules/disp/9da20421691741.5630659436bbd.png", "https://thecreativeextreme.com/wp-content/uploads/2017/07/Mikrotero-Creature-single.png", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDFYNIKXdK5DIpj4jrdScUnTDB9AjhxrgVl5rWXGYUBUGK2IXM&s", "https://s19.postimg.cc/5n0v3wbw3/mimic_book.png", "https://officialpsds.com/imageview/72/8n/728npx_large.png?1521316482", "https://i.pinimg.com/originals/ca/ae/07/caae07d7ea6258705164b5ee16bb05e5.png", "https://www.totalwine.com/dynamic/490x/media/sys_master/twmmedia/h29/h14/10979435577374.png", "http://www.ihstattler.com/wp/wp-content/uploads/2016/10/Eye-Creature-Copy-joseph-yoon.png", "https://images.fineartamerica.com/images/artworkimages/medium/1/rainbow-unicorn-clouds-and-stars-crista-forest-transparent.png"].sample, player_id: nil )
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
