class AddFieldsToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :sku, :string
    add_column :cards, :process, :string
    add_column :cards, :memory_options, :string
    add_column :cards, :core_frequency, :string
    add_column :cards, :memory_frequency, :string
    add_column :cards, :unified_shader_pipelines, :string
    add_column :cards, :memory_bus, :string    
    add_column :cards, :memory_type, :string
    add_column :cards, :peak_memory_bandwidth, :string
    add_column :cards, :standard_cooling, :string
    add_column :cards, :standard_slot_solution, :string
    add_column :cards, :external_power_need, :string
    add_column :cards, :directX, :string
    add_column :cards, :openGL, :string
    add_column :cards, :vga, :string
    add_column :cards, :dvi_i, :string
    add_column :cards, :tv_out , :string
    add_column :cards, :hdmi, :string
    add_column :cards, :display_port, :string
    add_column :cards, :hdmi_compliance, :string
    add_column :cards, :hdmi_modes, :string
    add_column :cards, :graphics_resolution, :string    
    add_column :cards, :min_power, :string
    add_column :cards, :max_power, :string
  end

  def self.down
    remove_column :cards, :sku
    remove_column :cards, :process
    remove_column :cards, :memory_options
    remove_column :cards, :core_frequency
    remove_column :cards, :memory_frequency
    remove_column :cards, :unified_shader_pipelines
    remove_column :cards, :memory_bus    
    remove_column :cards, :memory_type
    remove_column :cards, :peak_memory_bandwidth
    remove_column :cards, :standard_cooling
    remove_column :cards, :standard_slot_solution
    remove_column :cards, :external_power_need
    remove_column :cards, :directX
    remove_column :cards, :openGL
    remove_column :cards, :vga
    remove_column :cards, :dvi_i
    remove_column :cards, :tv_out
    remove_column :cards, :hdmi
    remove_column :cards, :display_port
    remove_column :cards, :hdmi_compliance
    remove_column :cards, :hdmi_modes
    remove_column :cards, :graphics_resolution    
    remove_column :cards, :min_power
    remove_column :cards, :max_power
  end
end
