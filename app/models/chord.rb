class Chord < ApplicationRecord
  has_many :inversions, dependent: :destroy
  validates :name, presence: true
  validates :chord_type, presence: true
end
