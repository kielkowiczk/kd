require 'test_helper'

class OpinionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: opinions
#
#  id          :integer         not null, primary key
#  description :text
#  language    :string(255)
#  card_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

