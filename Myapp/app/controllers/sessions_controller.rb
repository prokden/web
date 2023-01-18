class SessionsController < ApplicationController
  #before_action :require_no_authentication, only: %i[new create]
  #before_action :require_authentication, only: :destroy

  def new
  end

  def create
    render plain: params.to_yaml
  end

  def destroy
  end
end
