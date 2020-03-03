class UsersChannel < ApplicationCable::Channel

  def subscribed
    stream_from "user_channel_#{params[:user_id]}"
  end

end
