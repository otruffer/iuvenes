class AddAttachmentToVerbindung < ActiveRecord::Migration
  def self.up
    add_attachment :verbindungs, :logo
  end

  def self.down
    remove_attachment :verbindungs, :logo
  end
end
