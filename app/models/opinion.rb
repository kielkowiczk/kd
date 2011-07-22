class Opinion < ActiveRecord::Base
  belongs_to :card
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

