class Photo < ApplicationRecord

  belongs_to :article

  def with_data( data )

    self.article = data['article']
    self.uid = data['uid']

    if data['files']
      self.original_url = data['files']['original']
      self.large_url = data['files']['large']
      self.medium_url = data['files']['medium']
      self.small_url = data['files']['small']
    end

    if data['dimensions']
      self.width = data['dimensions']['width']
      self.height = data['dimensions']['height']
    end

    self

  end

end
