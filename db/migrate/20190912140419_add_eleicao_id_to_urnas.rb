class AddEleicaoIdToUrnas < ActiveRecord::Migration
  def change
    add_column :urnas, :eleicao_id, :integer
  end
end
