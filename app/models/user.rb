class User < ApplicationRecord
  belongs_to :avitar
  has_and_belongs_to_many :verifications
  has_and_belongs_to_many :roles
end
