class CreateVotacoes < ActiveRecord::Migration
  def change
    create_table :votacoes do |t|
      t.integer :votos
      t.references :urna, index: true, foreign_key: true
      t.references :candidato, index: true, foreign_key: true
      t.references :eleicao, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end