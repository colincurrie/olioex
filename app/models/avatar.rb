class Avatar < ApplicationRecord

  def with_data( data )
    update original_url: data['original'], large_url: data['large'], small_url: data['small']
    self
  end
end
