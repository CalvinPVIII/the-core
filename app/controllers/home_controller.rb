class HomeController < ApplicationController

def index
  if current_player
    @player = current_player
  end
  :index
end



end
