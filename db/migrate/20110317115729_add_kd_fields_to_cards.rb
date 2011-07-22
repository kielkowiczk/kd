class AddKdFieldsToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :is_quiet, :boolean, :default=>false
    add_column :cards, :is_power_efficint, :boolean, :default=>false
    add_column :cards, :good_tooverclocking, :boolean, :default=>false
    add_column :cards, :is_low_profile, :boolean, :default=>false
    add_column :cards, :to_office, :boolean, :default=>false
    add_column :cards, :to_movies, :boolean, :default=>false
    add_column :cards, :good_to_play_with_resoulution, :integer, :default=>0
  end

  def self.down
    remove_column("cards", "is_quiet")
    remove_column :cards, :is_power_efficint
    remove_column :cards, :good_tooverclocking
    remove_column :cards, :is_low_profile
    remove_column :cards, :to_office
    remove_column :cards, :to_movies
    remove_column :cards, :good_to_play_with_resoulution
  end
end
