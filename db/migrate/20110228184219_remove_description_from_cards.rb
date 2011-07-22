class RemoveDescriptionFromCards < ActiveRecord::Migration
  def self.up
    remove_column :cards, :description
  end

  def self.down
    add_column :cards, :descritpion, :text
  end
end
