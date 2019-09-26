class AddNumeroToUrnas < ActiveRecord::Migration
  def change
    add_column :urnas, :numero, :string, limit: 200
  end
end
