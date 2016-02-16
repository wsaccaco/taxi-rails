# == Schema Information
#
# Table name: drivers
#
#  id             :integer          not null, primary key
#  driv_plate     :string
#  driv_trademark :string
#  driv_colour    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
