class AddDescriptionToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :description, :text
  end

  def self.down
    remove_column :cards, :description
  end
end
