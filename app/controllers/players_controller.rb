class PlayersController < ApplicationController
  def index
    @players = Player.all.order(:rank)
    render 'index'
  end

  def update
    @player = Player.find(params[:id])
    @player.update drafted: !@player.drafted
    respond_to do |format|
      format.js
    end
  end
end
