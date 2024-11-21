class Plant < ApplicationRecord
  belongs_to :garden
  has_many :completions, dependent: :destroy
  has_many :chores, through: :plant_tags

  validates :name, presence: true
end
