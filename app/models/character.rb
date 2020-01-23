class Character < ApplicationRecord
  has_and_belongs_to_many(:items)
  has_and_belongs_to_many(:locations)
  has_and_belongs_to_many(:rivals)



  belongs_to(:user)

  scope :a_users_characters, -> (user_id)  { where(user_id: user_id) }


end
