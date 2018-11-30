class Slot < ApplicationRecord
  # Direct associations

  has_many   :sent_matches,
             :class_name => "Match",
             :foreign_key => "sender_availability_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
