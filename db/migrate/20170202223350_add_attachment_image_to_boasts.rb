class AddAttachmentImageToBoasts < ActiveRecord::Migration
  def self.up
    change_table :boasts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :boasts, :image
  end
end
