class Slot < ApplicationRecord
  # Direct associations

  has_many   :recipient_matches,
             :class_name => "Match",
             :foreign_key => "recipient_availability_id",
             :dependent => :destroy

  has_many   :sent_matches,
             :class_name => "Match",
             :foreign_key => "sender_availability_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
