class Slot < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
