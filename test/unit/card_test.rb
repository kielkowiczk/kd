require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end







# == Schema Information
#
# Table name: cards
#
#  id                            :integer         not null, primary key
#  name                          :string(255)
#  serie_id                      :integer
#  created_at                    :datetime
#  updated_at                    :datetime
#  sku                           :string(255)
#  process                       :string(255)
#  memory_options                :string(255)
#  core_frequency                :string(255)
#  memory_frequency              :string(255)
#  unified_shader_pipelines      :string(255)
#  memory_bus                    :string(255)
#  memory_type                   :string(255)
#  peak_memory_bandwidth         :string(255)
#  standard_cooling              :string(255)
#  standard_slot_solution        :string(255)
#  external_power_need           :string(255)
#  directX                       :string(255)
#  openGL                        :string(255)
#  vga                           :string(255)
#  dvi_i                         :string(255)
#  tv_out                        :string(255)
#  hdmi                          :string(255)
#  display_port                  :string(255)
#  hdmi_compliance               :string(255)
#  hdmi_modes                    :string(255)
#  graphics_resolution           :string(255)
#  min_power                     :string(255)
#  max_power                     :string(255)
#  link_to_gallery               :text
#  is_quiet                      :boolean         default(FALSE)
#  is_low_profile                :boolean         default(FALSE)
#  to_office                     :boolean         default(FALSE)
#  to_movies                     :boolean         default(FALSE)
#  good_to_play_with_resoulution :integer         default(0)
#  is_power_efficiant            :boolean         default(FALSE)
#  good_to_overclocking          :boolean
#

