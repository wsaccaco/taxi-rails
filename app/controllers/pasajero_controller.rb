class PasajeroController < ApplicationController

  def buscar_taxi

    @search_taxi = SearchTaxi.new(search_taxi_params)

=begin
    respond_to do |format|
      format.json{ render :json => { :users => current_user.id }}
    end
=end


=begin
    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg } # don't do msg.to_json
    end
=end



    respond_to do |format|
      if @search_taxi.save
        format.json { render :json => { :model => @search_taxi, :status => 'success' }, status: 200 }
      else
        format.json { render :json => @search_taxi.errors, status: :unprocessable_entity }
      end
    end
  end



  private

  def search_taxi_params
    params.permit(:search_geo_start, :search_geo_end, :search_referencia, :user_id)
  end

end
