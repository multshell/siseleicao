class CreateFornecedores < ActiveRecord::Migration
  def change
    create_table :fornecedores do |t|
      t.string :nome, limit: 100
      t.string :contato, limit: 50
      t.string :telefone, limit: 15
      t.string :email, limit: 100

      t.timestamps null: false
    end
  end
end
