class CreateEntidades < ActiveRecord::Migration
  def change
    create_table :entidades do |t|
      t.string :sigla, limit: 10
      t.string :nome, limit: 100

      t.timestamps null: false
    end
  end
end
