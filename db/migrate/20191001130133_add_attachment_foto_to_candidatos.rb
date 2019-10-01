class AddAttachmentFotoToCandidatos < ActiveRecord::Migration
  def self.up
    change_table :candidatos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :candidatos, :foto
  end
end
