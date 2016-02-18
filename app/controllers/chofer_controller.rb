class ChoferController < ApplicationController

  def search_race
    @driver = Driver.find_by(user_id: current_user.id)

    @service = Service.where("driver_id = ? and (serv_status = ? OR serv_status = ?)", @driver.id, 'ACEPTADO', 'CARRERA' )

    respond_to do |format|
      if  @service.length > 0
        format.json { render :json => { :model => @service[0], :status => 'carrera' }, status: 200 }
      else
        @searchTaxi = SearchTaxi.where("search_datetime >= ? and search_status = ?", DateTime.now - 60.second, 'BUSCANDO' )
        format.json { render :json => { :model => @searchTaxi, :status => 'success' }, status: 200 }
      end

    end

  end

  def accept_race
    @service = Service.new(accept_race_params)

    respond_to do |format|
      if @service.save
        format.json { render :json => { :model => @service, :status => 'success' }, status: 200 }
      else
        format.json { render :json => @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def getChofer

    @service = Service.find( params[:id] )
    @search_taxi = @service.search_taxi
    @profile = @search_taxi.user.profile
    respond_to do |format|
      format.json { render :json => { :search_taxi => @search_taxi, :client => @profile, :status => 'success' }, status: 200 }
    end

  end

  def atender
    @service_id = params[:id]
  end

  private

  def accept_race_params
    params.permit(:driver_id, :search_taxi_id)
  end

end
