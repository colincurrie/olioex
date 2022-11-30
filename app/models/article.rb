class Article < ApplicationRecord

  belongs_to :location
  belongs_to :value
  belongs_to :user
  belongs_to :reaction
  has_many :photos

  paginates_per 10

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
    update_location( data['location'] )
    update_value( data['value'] )
    update_reaction( data['reactions'] )
    update_user( data['user'] )

    # Update the collection of photos, this should update self.photos...
    data['photos'].each do |data|
      Photo.find_or_create_by( article: self, uid: data['uid'] ).with_data( data )
    end

    self

  end

  def update_location( data )
    if self.location
      self.location.update( data )
    else
      self.location = Location.create( data )
    end
  end

  def update_value( data)
    if self.value
      self.value.update( data )
    else
      self.value = Value.create( data )
    end
  end

  def update_reaction( data )
    if self.reaction
      self.reaction.update( data )
    else
      self.reaction = Reaction.create( data )
    end
  end

  def update_user( data )
    if self.user
      self.user.with_data( data )
    else
      self.user = User.find_or_create_by( id: data['id'] ).with_data( data )
    end
  end

end
