class User < ApplicationRecord
  has_and_belongs_to_many :verifications
  has_and_belongs_to_many :roles
  belongs_to :avatar

  def with_data( options )

    self.first_name = options['first_name']

    if options['rating']
      self.rating = options['rating']['rating']
      self.number = options['rating']['number']
    end

    if options['location']
      self.latitude = options['location']['latitude']
      self.longitude = options['location']['longitude']
    end

    self.avatar = Avatar.new().with_data( options['current_avatar'] )

    self.roles = options['roles'].map { |name| Role.find_or_create_by( name: name ) }

    self

  end
end
