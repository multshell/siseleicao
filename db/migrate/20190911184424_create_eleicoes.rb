class CreateEleicoes < ActiveRecord::Migration
  def change
    create_table :eleicoes do |t|
      t.string :descricao, limit: 200
      t.integer :numerournas
      t.integer :numeroeleitores
      t.integer :numerocandidatos
      t.integer :total_votos
      t.datetime :tempo_apuracao
      t.datetime :inicio_apuracao
      t.datetime :final_apuracao
      t.string :status, limit: 1
      

      t.timestamps null: false
    end
  end
end
