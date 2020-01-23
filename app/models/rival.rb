class Rival < ApplicationRecord
  has_and_belongs_to_many(:characters)

  has_one_attached :rival_avatar


end
