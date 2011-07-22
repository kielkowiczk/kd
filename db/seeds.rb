# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

puts "Cleaning db"
Card.delete_all
Serie.delete_all

puts "Creating new series..."
seria1 = Serie.new(:name=>'HD 5000')
seria2 = Serie.new(:name=>'HD 4000')

puts "Saving new series to db"
seria1.save
seria2.save

puts "Populating new series"
seria1.cards.create :name=>'HD5870 4GB TOXIC', 
                    :sku=>'11165-01', 
                    :process => "40 nm", 
                    :memory_options => "2 x 2GB",
                    :core_frequency => "900", 
                    :memory_frequency => "1200",
                    :unified_shader_pipelines => "3200", 
                    :memory_bus => "2 x 256", 
                    :memory_type => "GDDR5", 
                    :peak_memory_bandwidth => "2 x 153,6", 
                    :standard_cooling => "Aktywne, Arctic Cooling", 
                    :standard_slot_solution => "3", 
                    :external_power_need => "Tak, 2 x 8-pin", 
                    :directX => "11",
                    :openGL => "4.0", 
                    :vga => "Przez adapter", 
                    :dvi_i => "2", 
                    :tv_out => "0", 
                    :hdmi => "Przez adapter", 
                    :display_port => "1 x mini-DP", 
                    :hdmi_compliance => "HDMI 1.3 / tak", 
                    :hdmi_modes => "480p, 720p, 1080i, 1080p", 
                    :graphics_resolution => "3 x 2560x1600", 
                    :min_power => "60", 
                    :max_power => "370",
                    :opinions_attributes =>[{:language=>"pl", :description=>"Opis po polsku karty HD5870 4GB TOXIC"},
                                            {:language=>"en", :description=>"English description for HD5870 4GB TOXIC"}],
                    :is_quiet=>1,
                    :is_power_efficiant=>1,
                    :good_to_overclocking=>0,
                    :is_low_profile=>1,
                    :to_office=>1,
                    :to_movies=>1,
                    :good_to_play_with_resoulution=>1

seria1.cards.create :name=>'HD5970 2GB TOXIC',
                    :sku=>'11165-01', 
                    :process => "40 nm", 
                    :memory_options => "1 x 2GB",
                    :core_frequency => "1900", 
                    :memory_frequency => "200",
                    :unified_shader_pipelines => "3200",
                    :memory_bus => "2 x 256",
                    :memory_type => "GDDR4",
                    :peak_memory_bandwidth => "2 x 153,6",
                    :standard_cooling => "Aktywne, Arctic Cooling",
                    :standard_slot_solution => "3",
                    :external_power_need => "Tak, 2 x 8-pin",
                    :directX => "10.1",
                    :openGL => "3.0",
                    :vga => "Przez adapter",
                    :dvi_i => "1",
                    :tv_out => "0",
                    :hdmi => "Przez adapter",
                    :display_port => "1 x mini-DP",
                    :hdmi_compliance => "HDMI 1.1 / tak",
                    :hdmi_modes => "480p, 720p, 1080i",
                    :graphics_resolution => "3 x 2560x1600",
                    :min_power => "60",
                    :max_power => "170",
                    :opinions_attributes =>[{:language=>"pl", :description=>"Opis po polsku karty HD5970 2GB TOXIC"},
                                            {:language=>"en", :description=>"English description for HD5970 2GB TOXIC"}],
                                            
                    :is_quiet=>1,
                    :is_power_efficiant=>1,
                    :good_to_overclocking=>0,
                    :is_low_profile=>1,
                    :to_office=>1,
                    :to_movies=>1,
                    :good_to_play_with_resoulution=>1
                    
seria1.cards.create :name=>'HD5770 2GB TOXIC', 
                    :sku=>'11165-02', 
                    :process => "50 nm", 
                    :memory_options => "2 x 2GB",
                    :core_frequency => "1000", 
                    :memory_frequency => "200",
                    :unified_shader_pipelines => "200", 
                    :memory_bus => "1 x 256", 
                    :memory_type => "GDDR5", 
                    :peak_memory_bandwidth => "3 x 153,6", 
                    :standard_cooling => "Aktywne, Arctic Cooling", 
                    :standard_slot_solution => "3", 
                    :external_power_need => "Tak, 1 x 8-pin", 
                    :directX => "11",
                    :openGL => "1.0", 
                    :vga => "Przez adapter", 
                    :dvi_i => "2", 
                    :tv_out => "0", 
                    :hdmi => "Przez adapter", 
                    :display_port => "1 x mini-DP", 
                    :hdmi_compliance => "HDMI 2.3 / tak", 
                    :hdmi_modes => "480p, 720p", 
                    :graphics_resolution => "4 x 2560x1600", 
                    :min_power => "160", 
                    :max_power => "370",
                    :opinions_attributes =>[{:language=>"pl", :description=>"Opis po polsku karty HD5770 2GB TOXIC"},
                                            {:language=>"en", :description=>"English description for HD5770 2GB TOXIC"}],
                    :is_quiet=>0,
                    :is_power_efficiant=>0,
                    :good_to_overclocking=>1,
                    :is_low_profile=>0,
                    :to_office=>1,
                    :to_movies=>1,
                    :good_to_play_with_resoulution=>4
                    

seria2.cards.create :name=>'HD4870 4GB TOXIC', 
                    :sku=>'11165-01', 
                    :process => "40 nm", 
                    :memory_options => "2 x 2GB",
                    :core_frequency => "800", 
                    :memory_frequency => "1200",
                    :unified_shader_pipelines => "3100", 
                    :memory_bus => "2 x 128", 
                    :memory_type => "GDDR5", 
                    :peak_memory_bandwidth => "2 x 153,6", 
                    :standard_cooling => "Aktywne, Arctic Cooling", 
                    :standard_slot_solution => "3", 
                    :external_power_need => "Tak, 2 x 8-pin", 
                    :directX => "11",
                    :openGL => "4.0", 
                    :vga => "Przez adapter", 
                    :dvi_i => "2", 
                    :tv_out => "0", 
                    :hdmi => "Przez adapter", 
                    :display_port => "1 x mini-DP", 
                    :hdmi_compliance => "HDMI 1.3 / tak", 
                    :hdmi_modes => "480p, 720p, 1080i, 1080p", 
                    :graphics_resolution => "3 x 2560x1600", 
                    :min_power => "60", 
                    :max_power => "370",
                    :opinions_attributes =>[{:language=>"pl", :description=>"Opis po polsku karty HD5870 4GB TOXIC"},
                                            {:language=>"en", :description=>"English description for HD5870 4GB TOXIC"}],
                    :is_quiet=>1,
                    :is_power_efficiant=>1,
                    :good_to_overclocking=>1,
                    :is_low_profile=>0,
                    :to_office=>1,
                    :to_movies=>1,
                    :good_to_play_with_resoulution=>3

seria2.cards.create :name=>'HD4970 2GB TOXIC',
                    :sku=>'11165-01', 
                    :process => "40 nm", 
                    :memory_options => "1 x 2GB",
                    :core_frequency => "1900", 
                    :memory_frequency => "100",
                    :unified_shader_pipelines => "3200",
                    :memory_bus => "2 x 256",
                    :memory_type => "GDDR2",
                    :peak_memory_bandwidth => "2 x 153,6",
                    :standard_cooling => "Aktywne, Arctic Cooling",
                    :standard_slot_solution => "3",
                    :external_power_need => "Tak, 2 x 8-pin",
                    :directX => "10.1",
                    :openGL => "3.0",
                    :vga => "Przez adapter",
                    :dvi_i => "1",
                    :tv_out => "0",
                    :hdmi => "Przez adapter",
                    :display_port => "1 x mini-DP",
                    :hdmi_compliance => "HDMI 1.1 / tak",
                    :hdmi_modes => "480p, 720p, 1080i",
                    :graphics_resolution => "3 x 2560x1600",
                    :min_power => "100",
                    :max_power => "170",
                    :opinions_attributes =>[{:language=>"pl", :description=>"Opis po polsku karty HD5970 2GB TOXIC"},
                                            {:language=>"en", :description=>"English description for HD5970 2GB TOXIC"}],

                    :is_quiet=>0,
                    :is_power_efficiant=>0,
                    :good_to_overclocking=>1,
                    :is_low_profile=>1,
                    :to_office=>1,
                    :to_movies=>1,
                    :good_to_play_with_resoulution=>4

seria2.cards.create :name=>'HD4770 2GB TOXIC', 
                    :sku=>'11165-02', 
                    :process => "50 nm", 
                    :memory_options => "2 x 2GB",
                    :core_frequency => "100", 
                    :memory_frequency => "200",
                    :unified_shader_pipelines => "200", 
                    :memory_bus => "1 x 256", 
                    :memory_type => "GDDR5", 
                    :peak_memory_bandwidth => "3 x 153,6", 
                    :standard_cooling => "Aktywne, Arctic Cooling", 
                    :standard_slot_solution => "3", 
                    :external_power_need => "Tak, 1 x 8-pin", 
                    :directX => "11",
                    :openGL => "1.0", 
                    :vga => "Przez adapter", 
                    :dvi_i => "2", 
                    :tv_out => "0", 
                    :hdmi => "Przez adapter", 
                    :display_port => "1 x mini-DP", 
                    :hdmi_compliance => "HDMI 2.3 / tak", 
                    :hdmi_modes => "480p, 720p", 
                    :graphics_resolution => "4 x 2560x1600", 
                    :min_power => "160", 
                    :max_power => "370",
                    :opinions_attributes =>[{:language=>"pl", :description=>"Opis po polsku karty HD5770 2GB TOXIC"},
                                            {:language=>"en", :description=>"English description for HD5770 2GB TOXIC"}],
                    :is_quiet=>1,
                    :is_power_efficiant=>1,
                    :good_to_overclocking=>0,
                    :is_low_profile=>0,
                    :to_office=>1,
                    :to_movies=>1,
                    :good_to_play_with_resoulution=>1