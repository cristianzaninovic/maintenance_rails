class RenameTypeToMantentionClassInMaintenances < ActiveRecord::Migration[7.0]
  def change
    rename_column :maintenances, :type, :maintenance_class
  end
end
