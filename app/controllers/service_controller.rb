class ServiceController < ApplicationController
  def update
    @service = Service.find( params[:id] )
    respond_to do |format|
      if @service.update(service_params)
        format.json { render :json => { :service => @service, :status => 'success' }, status: 200 }
      end
    end
  end

  def verifica
    @service = Service.find(params[:id])
    respond_to do |format|
      format.json { render :json => { :service => @service, :status => 'success' }, status: 200 }
    end
  end

  def loencontre
    @service = Service.find_by(search_taxi_id: params[:search_taxi_id], serv_status: 'ACEPTADO')
    respond_to do |format|
        format.json { render :json => { :service => @service, :status => 'success' }, status: 200 }
    end
  end

  def service_params
    params.permit(:serv_status, :serv_waypoint)
  end

end
