class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
end
