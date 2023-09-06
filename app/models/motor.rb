class Motor < ApplicationRecord
  has_many :maintenances
  enum type: [:reaction, :turbo]
  has_one_attached :main_image
  
  # Callback para establecer el nombre antes de la validación
  before_validation :set_motor_name, on: :create

  private

  def set_motor_name
    # Asegúrate de que el tipo sea válido (puedes agregar más validaciones según tu lógica)
    if self.type.present? && self.type.in?(Motor.types.keys)
      # Encuentra el último motor de ese tipo y obtén su número
      last_motor = Motor.where(type: self.type).order(:number).last
      number = last_motor ? last_motor.number + 1 : 1

      # Establece el nombre del motor basado en el tipo y el número
      self.name = "#{self.type}_#{number}"
    else
      errors.add(:type, "Tipo de motor no válido")
    end
  end
end
