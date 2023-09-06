class Maintenance < ApplicationRecord
  belongs_to :motor
  belongs_to :user
  belongs_to :city
  has_many :maintenance_material_lists
  has_many :materials, through: :maintenance_material_lists
  enum maintenance_class: [:preventive, :corrective]
  validates :maintenance_class, presence: true
  before_validation :set_maintenance_name
  
  private

  def set_maintenance_name
    if self.motor.present? && self.date.present?
      self.name = "#{self.motor.name}-#{self.date}"    
    end
  end
end
