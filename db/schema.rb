# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110317170810) do

  create_table "cards", :force => true do |t|
    t.string   "name"
    t.integer  "serie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sku"
    t.string   "process"
    t.string   "memory_options"
    t.string   "core_frequency"
    t.string   "memory_frequency"
    t.string   "unified_shader_pipelines"
    t.string   "memory_bus"
    t.string   "memory_type"
    t.string   "peak_memory_bandwidth"
    t.string   "standard_cooling"
    t.string   "standard_slot_solution"
    t.string   "external_power_need"
    t.string   "directX"
    t.string   "openGL"
    t.string   "vga"
    t.string   "dvi_i"
    t.string   "tv_out"
    t.string   "hdmi"
    t.string   "display_port"
    t.string   "hdmi_compliance"
    t.string   "hdmi_modes"
    t.string   "graphics_resolution"
    t.string   "min_power"
    t.string   "max_power"
    t.text     "link_to_gallery"
    t.boolean  "is_quiet",                      :default => false
    t.boolean  "is_low_profile",                :default => false
    t.boolean  "to_office",                     :default => false
    t.boolean  "to_movies",                     :default => false
    t.integer  "good_to_play_with_resoulution", :default => 0
    t.boolean  "is_power_efficiant",            :default => false
    t.boolean  "good_to_overclocking"
  end

  create_table "opinions", :force => true do |t|
    t.text     "description"
    t.string   "language"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
