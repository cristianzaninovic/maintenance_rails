class Motor < ApplicationRecord
  has_many :maintenances
  enum motor_class: [:reaction, :turbo]
  has_one_attached :main_image
  
  # Callback para establecer el nombre antes de la validación
  before_validation :set_motor_name, on: :create

  def self.search(search)
    if search  
      find(:all, :conditions => ['description LIKE ?', "%#{search}%"])  
    else  
      find(:all)  
    end  
  end

  private

  def set_motor_name
    if self.motor_class.present? && self.motor_class.in?(Motor.motor_classes.keys)
      last_motor = Motor.where(motor_class: self.motor_class).count
      number = last_motor ? last_motor + 1 : 1
      self.name = "#{self.motor_class}_#{number}"
    else
      errors.add(:motor_class, "Tipo de motor no válido")
    end
  end
end
