class Match < ApplicationRecord
  # Direct associations

  belongs_to :recipient_availability,
             :class_name => "Slot",
             :counter_cache => :recipient_matches_count

  belongs_to :sender_availability,
             :class_name => "Slot",
             :counter_cache => :sent_matches_count

  # Indirect associations

  # Validations

end
