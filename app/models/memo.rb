class Memo < ApplicationRecord
    has_many: room_users
    has_many: rooms, through: :room_users
    has_many: memos

    validates :text, presence: true
end
