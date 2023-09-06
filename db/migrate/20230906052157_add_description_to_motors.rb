class AddDescriptionToMotors < ActiveRecord::Migration[7.0]
  def change
    add_column :motors, :description, :text
  end
end
