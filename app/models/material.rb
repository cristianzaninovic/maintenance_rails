class Material < ApplicationRecord
  has_many :maintenances, through: :maintenance_material_lists
  validates :name, presence: true
end
