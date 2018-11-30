class User < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :foreign_key => "author_id",
             :dependent => :destroy

  has_many   :slots,
             :dependent => :destroy

  # Indirect associations

  has_many   :sent_matches,
             :through => :slots,
             :source => :sent_matches

  has_many   :received_matches,
             :through => :slots,
             :source => :recipient_matches

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
