class Article < ApplicationRecord

  belongs_to :location
  belongs_to :value
  has_one :user
  belongs_to :reaction
  has_many :photos

  paginates_per 10

  attr_accessor :user

  # TODO: with_data is a terrible name - rename it
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
      last_listed: data['last_listed']
    )

    # simple one to one relationships, just find and update
    location.update( data['location'] )
    value.update( data['value'] )
    reaction.update( data['reactions'] )

    # Find and update the user by the user id in the data
    User.find_or_create_by( id: id ).with_data( data['user'] )

    # Update the collection of photos, this should update self.photos...
    data['photos'].each do |data|
      Photo.find_or_create_by( article: self, uid: data['uid'] ).with_data( data )
    end

    self

  end

  def location
    @location ||= Location.create()
  end

  def value
    @value ||= Value.create()
  end

  def reaction
    @reaction ||= Reaction.create()
  end

end
