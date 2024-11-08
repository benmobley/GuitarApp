class Inversion < ApplicationRecord
  belongs_to :chord
  validates :name, presence: true
end
