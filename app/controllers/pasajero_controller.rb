class PasajeroController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect, :except => [:getPasajero]

  def redirect
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.profile_type == 'CHOFER'
      redirect_to chofer_atencion_path
    end
  end

  def index

  end

  def buscar_taxi

    @search_taxi = SearchTaxi.new(search_taxi_params)

    respond_to do |format|
      if @search_taxi.save
        format.json { render :json => { :search_taxi => @search_taxi, :status => 'success' }, status: 200 }
      else
        format.json { render :json => @search_taxi.errors, status: :unprocessable_entity }
      end
    end
  end

  def verifica
    search_taxi = SearchTaxi.find_by( user_id: current_user.id, search_status: 'ACEPTADO' )

    respond_to do |format|
      unless !search_taxi
        @service = Service.find_by(search_taxi_id: search_taxi.id, serv_status: "ACEPTADO" )
        format.json { render :json => { :search_taxi => search_taxi, :service => @service, :status => 'success' }, status: 200 }
      else
        format.json { render :json => { :search_taxi => search_taxi, :status => 'success' }, status: 200 }
      end

    end
  end

  def getPasajero

      @service = Service.find( params[:id] )
      @search_taxi = @service.search_taxi
      @profile = @search_taxi.user.profile
      respond_to do |format|
        format.json { render :json => {
            :search_taxi => @search_taxi,
            :client => @profile,
            :service => @service,
            :status => 'success' }, status: 200 }
      end
  end

  def abordar
    @service_id = params[:id]
  end

  private

  def search_taxi_params
    params.permit(:search_geo_start, :search_geo_end, :search_referencia, :user_id)
  end

end
