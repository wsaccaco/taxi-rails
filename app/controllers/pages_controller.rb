class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @profile = Profile.new
    
  end

  def login
  end
end
