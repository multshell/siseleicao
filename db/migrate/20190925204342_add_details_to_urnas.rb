class AddDetailsToUrnas < ActiveRecord::Migration
  def change
    add_column :urnas, :secoes, :string, limit: 300
    add_column :urnas, :eleitores, :integer
  end
end
