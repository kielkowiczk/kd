class AddGalleryLinkToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :link_to_gallery, :text
  end

  def self.down
    remove_column :cards, :link_to_gallery
  end
end
