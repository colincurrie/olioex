class Reaction < ApplicationRecord

  has_one :article

  def like
    # increment the likes count and publish the new value
    self.likes = self.likes + 1

    ActionCable.server.broadcast( "likes", { body: "#{article.id}:#{likes}" } )
  end
end
