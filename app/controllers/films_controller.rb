class FilmsController < ApplicationController
  def index
    @films = Film.all.order :episode_id
  end

  def show
    @film = Film.find params[:id]
  end
end
