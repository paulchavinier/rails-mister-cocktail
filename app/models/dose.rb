class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, uniqueness: {scope: :ingredient}, presence: true
  validates :ingredient, presence: true
end
