class Photo < ApplicationRecord

  belongs_to :article

  def with_data( data )

    @uid = data['uid']

    if data['files']
      @original_url = data['files']['original']
      @large_url = data['files']['large']
      @medium_url = data['files']['medium']
      @small_url = data['files']['small']
    end

    if data['dimensions']
      @width = data['dimensions']['width']
      @height = data['dimensions']['height']
    end

    self

  end

end
