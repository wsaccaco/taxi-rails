# == Schema Information
#
# Table name: services
#
#  id                  :integer          not null, primary key
#  serv_datetime_start :datetime
#  serv_waypoint       :string
#  serv_precio         :float
#  serv_time           :datetime
#  serv_status         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  driver_id           :integer
#  search_taxi_id      :integer
#

class Service < ActiveRecord::Base
  before_save :default_values
  def default_values
    self.serv_status ||= 'ACEPTADO'
  end
end
