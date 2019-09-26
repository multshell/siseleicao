class CreateModalidades < ActiveRecord::Migration
  def change
    create_table :modalidades do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
