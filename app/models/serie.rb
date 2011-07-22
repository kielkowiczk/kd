class Serie < ActiveRecord::Base
  has_many :cards, :dependent => :destroy
end

# == Schema Information
#
# Table name: series
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

