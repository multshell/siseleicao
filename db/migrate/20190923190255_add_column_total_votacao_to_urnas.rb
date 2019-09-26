class AddColumnTotalVotacaoToUrnas < ActiveRecord::Migration
  def change
    add_column :urnas, :total_votacao, :integer
  end
end
