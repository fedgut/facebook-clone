# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user_id, uniqueness: { scope: :friend_id, message: 'Already sent!' }
end
