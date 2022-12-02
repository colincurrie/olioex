class LikeChannel < ApplicationCable::Channel

  def subscribed
    # specify the chanel name, in this instance there is only one channel, 'likes'
    stream_from "likes"
    binding.pry
  end

  def received(data)
    # Not sure I need to do anything here, the client side will update, not the server side, I think
  end
end
