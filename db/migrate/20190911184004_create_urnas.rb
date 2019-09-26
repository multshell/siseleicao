class CreateUrnas < ActiveRecord::Migration
  def change
    create_table :urnas do |t|
      t.string :escola, limit: 200
      t.string :localidade, limit: 200
      
      t.timestamps null: false
    end
  end
end
