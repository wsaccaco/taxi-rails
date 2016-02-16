# == Schema Information
#
# Table name: search_taxis
#
#  id                :integer          not null, primary key
#  search_datetime   :datetime
#  search_geo_start  :string
#  search_geo_end    :string
#  search_referencia :text
#  search_status     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#

require 'test_helper'

class SearchTaxiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
