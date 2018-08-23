class PlayersController < ApplicationController
  before_action :set_player, only: :update

  def index
    @players = Player.all.order(:rank)
    render 'index'
  end

  def update
    @player.update drafted: !@player.drafted
    broadcast_draft
  end

  private

  def broadcast_draft
    ActionCable.server.broadcast(
      'draft_channel', { player: @player, content: player_partial_content }
    )
  end

  def player_partial_content
    content = ApplicationController.render(
      partial: 'players/player', locals: { player: @player }
    )
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
