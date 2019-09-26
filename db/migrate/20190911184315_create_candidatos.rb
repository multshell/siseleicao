class CreateCandidatos < ActiveRecord::Migration
  def change
    create_table :candidatos do |t|
      t.string :numero, limit: 2
      t.string :nome_completo, limit: 200
      t.string :nome_campanha, limit: 200

      t.timestamps null: false
    end
  end
end
