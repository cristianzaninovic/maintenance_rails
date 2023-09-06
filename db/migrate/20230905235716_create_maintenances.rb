class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.date :date
      t.string :name
      t.integer :type
      t.belongs_to :motor, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
