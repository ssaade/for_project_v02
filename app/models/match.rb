class Match < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :recipient_availability,
             :class_name => "Slot",
             :counter_cache => :recipient_matches_count

  belongs_to :sender_availability,
             :class_name => "Slot",
             :counter_cache => :sent_matches_count

  # Indirect associations

  has_one    :receiving_user,
             :through => :recipient_availability,
             :source => :user

  # Validations

end
