class FixColumnNameInCards < ActiveRecord::Migration
  def self.up
    remove_column :cards, :good_tooverclocking
    remove_column :cards, :is_power_efficint
        
    add_column :cards, :is_power_efficiant, :boolean, :default=>false
    add_column :cards, :good_to_overclocking, :boolean, :deafult=>false
  end

  def self.down
    add_column :cards, :is_power_efficint, :boolean, :default=>0
    add_column :cards, :good_tooverclocking,  :boolean, :deafult=>false
    
    remove_column :cards, :is_power_efficiant
    remove_column :cards, :good_to_overclocking
  end
end
