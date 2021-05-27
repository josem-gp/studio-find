class Owner::StudiosController < ApplicationController
  def index
    @studios = current_user.studios
    authorize @studios
  end
end
