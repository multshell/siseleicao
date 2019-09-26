class CreateAditivos < ActiveRecord::Migration
  def change
    create_table :aditivos do |t|
      t.string :numero, limit: 50
      t.references :contrato, index: true, foreign_key: true
      t.references :tipo_aditivo, index: true, foreign_key: true
      t.integer :valor_cents, default: 0
      t.date :data_ass
      t.date :data_venc

      t.timestamps null: false
    end
  end
end
