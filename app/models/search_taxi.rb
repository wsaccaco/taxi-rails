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

class SearchTaxi < ActiveRecord::Base
  has_many :services
  belongs_to :user
  before_save :default_values
  def default_values
    self.search_status ||= 'BUSCANDO'
    self.search_datetime = DateTime.now
  end
end
