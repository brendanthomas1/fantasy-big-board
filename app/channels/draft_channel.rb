class DraftChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'draft_channel'
  end
end
