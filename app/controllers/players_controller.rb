class PlayersController < ApplicationController
  def index
    @players = Player.all.order(:rank)
    render
  end
end
