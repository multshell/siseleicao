class CreateTipoAditivos < ActiveRecord::Migration
  def change
    create_table :tipo_aditivos do |t|
      t.string :descricao, limit: 100

      t.timestamps null: false
    end
  end
end
