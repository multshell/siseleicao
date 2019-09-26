class AddColumnFinalizadaToUrnas < ActiveRecord::Migration
  def change
    add_column :urnas, :finalizada, :boolean, default: false
  end
end
