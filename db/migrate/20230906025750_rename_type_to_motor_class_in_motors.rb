class RenameTypeToMotorClassInMotors < ActiveRecord::Migration[7.0]
  def change
    rename_column :motors, :type, :motor_class
  end
end
