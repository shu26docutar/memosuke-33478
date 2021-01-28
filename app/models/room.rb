class Room < ApplicationRecord
    has_many :room_users
    has_many :users, through: :room_users
    has_many :memos

    validates :text, presence: true
end
