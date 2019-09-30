class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :eleicao, index: true, foreign_key: true
      t.datetime :data_hora
      t.text :descricao

      t.timestamps null: false
    end
  end
end
