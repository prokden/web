class UserControllers < ApplicationController
  def new
    @user = User.new
  end
end