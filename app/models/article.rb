class Article < ApplicationRecord
  belongs_to :location
  belongs_to :value
  belongs_to :user
  belongs_to :reaction
  has_many :photos

  def with_data( data )
    update(
      title: data['title'],
      description: data['description'],
      donation_description: data['donation_description'],
      section: data['section'],
      collection_notes: data['collection_notes'],
      status: data['status'],
      expiry: data['expiry'],
      is_owner: data['is_owner'],
      last_listed: data['last_listed'],
      location: Location.create( data['location'] ),
      value: Value.create( data['value'] ),
      reaction: Reaction.create( data['reactions'] ),
      user: User.create().with_data( data['user'] )
    )

    data['photos'].each { |data| Photo.new().with_data( data.merge( 'article' => self ))}
    #self.photos = data['photos'].each { |photo| Photo.new( photo.merge( 'article' => self ))}

    self

  end
end
