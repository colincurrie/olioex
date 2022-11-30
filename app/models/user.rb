class User < ApplicationRecord
  has_and_belongs_to_many :verifications
  has_and_belongs_to_many :roles
  belongs_to :avatar
  has_many :articles

  def with_data( options )

    update(
      first_name: options['first_name'],
      rating: options['rating']&.[]('rating'),
      number: options['rating']&.[]('number'),
      latitude: options['location']&.[]('latitude'),
      longitude: options['location']&.[]('longitude')
    )

    update_avatar( options['current_avatar'] ) if options['current_avatar']

    # TODO: suttin aint right, this should be an association, not an array
    @roles = options['roles'].map { |name| Role.find_or_create_by( name: name ) } if options['roles']

    self

  end

  def update_avatar( data )
    if self.avatar
      self.avatar.with_data( data )
    else
      self.avatar ||= Avatar.create().with_data( data )
    end
  end

end
