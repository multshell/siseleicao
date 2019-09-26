class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.integer :numero
      t.string :ano, limit: 4
      t.references :entidade, index: true, foreign_key: true
      t.references :fornecedor, index: true, foreign_key: true
      t.integer :valor_cents, default: 0
      t.text :objeto
      t.references :modalidade, index: true, foreign_key: true
      t.date :data_ass
      t.date :data_venc

      t.timestamps null: false
    end
    add_index :contratos, [:numero, :ano], unique: true
  end
end
