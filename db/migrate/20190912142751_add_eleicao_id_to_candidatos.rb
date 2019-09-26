class AddEleicaoIdToCandidatos < ActiveRecord::Migration
  def change
    add_column :candidatos, :eleicao_id, :integer
  end
end
