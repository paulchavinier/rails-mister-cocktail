class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail }
end
