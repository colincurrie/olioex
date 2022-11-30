class User < ApplicationRecord
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :verifications
  has_and_belongs_to_many :roles
  belongs_to :avatar

  def with_data( options )

    @first_name = options['first_name']

    if options['rating']
      @rating = options['rating']['rating']
      @number = options['rating']['number']
    end

    if options['location']
      @latitude = options['location']['latitude']
      @longitude = options['location']['longitude']
    end

    avatar.with_data( options['current_avatar'] ) if options['current_avatar']

    # TODO: suttin aint right, this should be an association, not an array
    @roles = options['roles'].map { |name| Role.find_or_create_by( name: name ) } if options['roles']

    self

  end

  def avatar
    @avatar ||= Avatar.create()
  end

end
