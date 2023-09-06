class MaintenanceMaterialList < ApplicationRecord
  belongs_to :material
  belongs_to :maintenance
end
