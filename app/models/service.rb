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
  belongs_to :search_taxi
  belongs_to :driver

  before_save :default_values
  after_save :accept_race

  before_update :dependence_status

  def default_values
    self.serv_status ||= 'ACEPTADO'
  end

  def accept_race

    if self.serv_status == 'ACEPTADO'

      @searchtaxi = SearchTaxi.find( self.search_taxi_id )
      @searchtaxi.search_status = 'ACEPTADO'
      @searchtaxi.save

    end
  end

  def dependence_status

    if self.serv_status == 'CARRERA'
      self.serv_datetime_start = DateTime.now
      @searchtaxi = SearchTaxi.find( self.search_taxi_id )
      @searchtaxi.search_status = 'CARRERA'
      @searchtaxi.save
    end

    if self.serv_status == 'TERMINADO'
      self.serv_time = DateTime.now
      self.serv_precio = ((self.serv_datetime_start - DateTime.now) * -1) /60
      @searchtaxi = SearchTaxi.find( self.search_taxi_id )
      @searchtaxi.search_status = 'TERMINADO'
      @searchtaxi.save
    end

  end

end
