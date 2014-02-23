class TeasersController < ApplicationController

  def index
  end

  def create
    user = User.create(email: params[:email])
    if user.errors.present?
      head :bad_request
    else
      head :created
    end
  end
end
