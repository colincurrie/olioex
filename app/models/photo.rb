class Photo < ApplicationRecord

  belongs_to :article

  def with_data( data )

    update(
      uid: data['uid'],
      original_url: data['files']&.[]('original'),
      large_url: data['files']&.[]('large'),
      medium_url: data['files']&.[]('medium'),
      small_url: data['files']&.[]('small'),
      width: data['dimensions']&.[]('width'),
      height: data['dimensions']&.[]('height')
    )

    self

  end

end
