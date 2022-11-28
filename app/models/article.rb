class Article < ApplicationRecord
  belongs_to :location
  belongs_to :value
  belongs_to :reactions
  belongs_to :photos
  belongs_to :user
end
